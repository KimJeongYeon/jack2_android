/** @file simple_keyboard.c
 *
 * @brief simple keyboard for JACK
 */

#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <signal.h>
#ifndef WIN32
#include <unistd.h>
#endif
#include <jack/jack.h>

jack_port_t *output_port1, *output_port2, *input_port1, *input_port2;
jack_client_t *client;

typedef struct  WAV_HEADER
{
     char                RIFF[4];        /* RIFF Header      */ //Magic header
     unsigned long       ChunkSize;      /* RIFF Chunk Size  */
     char                WAVE[4];        /* WAVE Header      */
     char                fmt[4];         /* FMT header       */
     unsigned long       Subchunk1Size;  /* Size of the fmt chunk                                */
     unsigned short      AudioFormat;    /* Audio format 1=PCM,6=mulaw,7=alaw, 257=IBM Mu-Law, 258=IBM A-Law, 259=ADPCM */
     unsigned short      NumOfChan;      /* Number of channels 1=Mono 2=Sterio                   */
     unsigned long       SamplesPerSec;  /* Sampling Frequency in Hz                             */
     unsigned long       bytesPerSec;    /* bytes per second */
     unsigned short      blockAlign;     /* 2=16-bit mono, 4=16-bit stereo */
     unsigned short      bitsPerSample;  /* Number of bits per sample      */
     char                Subchunk2ID[4]; /* "data"  string   */
     unsigned long       Subchunk2Size;  /* Sampled data length    */
} wav_hdr;

typedef struct
{
    char *ptr;
    int size;
    int offset;
} paKeyData;

paKeyData *curKey = NULL;
paKeyData *oldKey = NULL;
paKeyData Key1, Key2, Key3;

static void signal_handler(int sig)
{
	jack_client_close(client);
	fprintf(stderr, "signal received, exiting ...\n");
	exit(0);
}

/**
 * The process callback for this JACK application is called in a
 * special realtime thread once for each audio cycle.
 *
 * This client follows a simple rule: when the JACK transport is
 * running, copy the input port to the output.  When it stops, exit.
 */

int
process (jack_nframes_t nframes, void *arg)
{
	jack_default_audio_sample_t *out1, *out2, *in1, *in2;
   int i;

	out1 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port1, nframes);
	out2 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port2, nframes);
   in1 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port1, nframes);
   in2 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port2, nframes);

	for( i=0; i<nframes; i++ )
   {
      if(curKey)
      {
         out1[i] = 0.3 * ( *( (signed short *)(curKey->ptr) + curKey->offset ) / 32767.0 ) + in1[i];
         out2[i] = 0.3 * ( *( (signed short *)(curKey->ptr) + curKey->offset ) / 32767.0 ) + in2[i];
         curKey->offset += 1;
         if( curKey->offset >= curKey->size )
         {
            curKey->offset = 0;
            curKey = NULL;
         }
      }
      else //NULL
      {
         out1[i] = in1[i];
         out2[i] = in2[i];
      }
   }
    
	return 0;      
}

/**
 * JACK calls this shutdown_callback if the server ever shuts down or
 * decides to disconnect the client.
 */
void
jack_shutdown (void *arg)
{
   if(Key1.ptr)  free(Key1.ptr);
   if(Key2.ptr)  free(Key2.ptr);
   if(Key3.ptr)  free(Key3.ptr);
	exit (1);
}

unsigned int getFileSize(FILE **file)
{
    unsigned int size;
    if(fseek(*file, 0, SEEK_END) == -1){ return -1; }
    size = ftell(*file);
    fseek(*file, 0, SEEK_SET);
    return size;
}

char *getFileBuffer(FILE **file, unsigned int fileSize)
{
    char *buffer = malloc(fileSize + 1);
    fread(buffer, fileSize, 1, *file);
    return buffer;
}

unsigned int readWaveFileToMemory(char path[], char **buffer)
{
    unsigned int fileSize;

    FILE *file = fopen(path, "rb");
    if(file != NULL){
        fileSize = getFileSize(&file);
        fseek(file, sizeof(wav_hdr), SEEK_SET);  //skip wav header
        *buffer = getFileBuffer(&file, fileSize - sizeof(wav_hdr));
        fclose(file);
        return (fileSize - sizeof(wav_hdr));
    }else{
        *buffer = NULL;
        return -1;
    }
}

int
main (int argc, char *argv[])
{
	const char **ports;
	const char *client_name;
	const char *server_name = NULL;
	jack_options_t options = JackNullOption;
	jack_status_t status;

   char *file_buffer;
   int file_size;

   if (argc >= 2)
   {
      client_name = argv[1];
   }
   else
   {
      fprintf (stderr, "Usage : jack_simple_keyboard <client_name>\n");
      exit (1);
   }

   /* read file... */

   if((file_size = readWaveFileToMemory("/sdcard/Sounds/key1.wav", &file_buffer)) <= 0)
   {
      fprintf (stderr, "Unable to open file 1\n");
      exit (1);
   }
   Key1.ptr = file_buffer;
   Key1.size = file_size / 2;  //number of sample (signed 16bit mono)
   Key1.offset = 0;

   if((file_size = readWaveFileToMemory("/sdcard/Sounds/key2.wav", &file_buffer)) <= 0)
   {
      fprintf (stderr, "Unable to open file 2\n");
      exit (1);
   }
   Key2.ptr = file_buffer;
   Key2.size = file_size / 4;  //number of sample
   Key2.offset = 0;

   if((file_size = readWaveFileToMemory("/sdcard/Sounds/key3.wav", &file_buffer)) <= 0)
   {
      fprintf (stderr, "Unable to open file 3\n");
      exit (1);
   }
   Key3.ptr = file_buffer;
   Key3.size = file_size / 4;  //number of sample
   Key3.offset = 0;

	/* open a client connection to the JACK server */

	client = jack_client_open (client_name, options, &status, server_name);
	if (client == NULL) {
		fprintf (stderr, "jack_client_open() failed, "
			 "status = 0x%2.0x\n", status);
		if (status & JackServerFailed) {
			fprintf (stderr, "Unable to connect to JACK server\n");
		}
		exit (1);
	}
	if (status & JackServerStarted) {
		fprintf (stderr, "JACK server started\n");
	}
	if (status & JackNameNotUnique) {
		client_name = jack_get_client_name(client);
		fprintf (stderr, "unique name `%s' assigned\n", client_name);
	}

	/* tell the JACK server to call `process()' whenever
	   there is work to be done.
	*/

	jack_set_process_callback (client, process, 0);

	/* tell the JACK server to call `jack_shutdown()' if
	   it ever shuts down, either entirely, or if it
	   just decides to stop calling us.
	*/

	jack_on_shutdown (client, jack_shutdown, 0);

	/* create two ports */

	output_port1 = jack_port_register (client, "output1",
					  JACK_DEFAULT_AUDIO_TYPE,
					  JackPortIsOutput, 0);

	output_port2 = jack_port_register (client, "output2",
					  JACK_DEFAULT_AUDIO_TYPE,
					  JackPortIsOutput, 0);

	input_port1 = jack_port_register (client, "input1",
					  JACK_DEFAULT_AUDIO_TYPE,
					  JackPortIsInput, 0);

	input_port2 = jack_port_register (client, "input2",
					  JACK_DEFAULT_AUDIO_TYPE,
					  JackPortIsInput, 0);

	if ((output_port1 == NULL) || (output_port2 == NULL)) {
		fprintf(stderr, "no more JACK ports available\n");
		exit (1);
	}

	/* Tell the JACK server that we are ready to roll.  Our
	 * process() callback will start running now. */

	if (jack_activate (client)) {
		fprintf (stderr, "cannot activate client");
		exit (1);
	}

	/* Connect the ports.  You can't do this before the client is
	 * activated, because we can't make connections to clients
	 * that aren't running.  Note the confusing (but necessary)
	 * orientation of the driver backend ports: playback ports are
	 * "input" to the backend, and capture ports are "output" from
	 * it.
	 */
	ports = jack_get_ports (client, NULL, NULL,
				JackPortIsPhysical|JackPortIsInput);
	if (ports == NULL) {
		fprintf(stderr, "no physical playback ports\n");
		exit (1);
	}

	if (jack_connect (client, jack_port_name (output_port1), ports[0])) {
		fprintf (stderr, "cannot connect output ports\n");
	}

	if (jack_connect (client, jack_port_name (output_port2), ports[1])) {
		fprintf (stderr, "cannot connect output ports\n");
	}

	free (ports);

    /* install a signal handler to properly quits jack client */
#ifdef WIN32
	signal(SIGINT, signal_handler);
	signal(SIGABRT, signal_handler);
	signal(SIGTERM, signal_handler);
#else
	signal(SIGQUIT, signal_handler);
	signal(SIGTERM, signal_handler);
	signal(SIGHUP, signal_handler);
	signal(SIGINT, signal_handler);
#endif

	/* keep running until the Ctrl+C */

	while (1) {
      int key;
      if((key = fgetc(stdin)) != 0)
      {
         if(key == 'a' || key == 'A')
         {
            curKey = &Key1;
            curKey->offset = 0;
         }
         else if (key == 's' || key == 'S')
         {
            curKey = &Key2;
            curKey->offset = 0;
         }
         else if( key == 'd' || key == 'D')
         {
            curKey = &Key3;
            curKey->offset = 0;
         }
         else  //enter
         {
            curKey = oldKey;
            curKey->offset = 0;
         }
         oldKey = curKey;
      }

	#ifdef WIN32 
		Sleep(1000);
	#else
		//sleep (1);
	#endif
	}

	jack_client_close (client);
	exit (0);
}
