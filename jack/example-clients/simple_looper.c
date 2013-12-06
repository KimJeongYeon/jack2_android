/** @file simple_looper.c
 *
 * @brief simple looper for JACK
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

#undef JACK_TRANSPORT_TEST

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

wav_hdr wavHeader;

typedef struct
{
    char *ptr;
    int size;
    int offset;
} paLooperData;

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
	paLooperData *data = (paLooperData*)arg;
   //unsigned short *data_ptr;
   signed short *data_ptr;
   int i;
#ifdef JACK_TRANSPORT_TEST
   jack_position_t pos;
#endif

   if (data == NULL)
   {
      fprintf (stderr, "process arg is NULL");
      return 0;
   }

   //data_ptr = (unsigned short *)(data->ptr);
   data_ptr = (signed short *)(data->ptr);

	out1 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port1, nframes);
	out2 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port2, nframes);
   in1 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port1, nframes);
   in2 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port2, nframes);

	for( i=0; i<nframes; i++ )
   {
#ifdef JACK_TRANSPORT_TEST
       if(jack_transport_query(client, &pos) != JackTransportRolling)
       {
           out1[i] = 0.0;
           out2[i] = 0.0;
           continue;
       }
#endif

       if(wavHeader.NumOfChan == 1)  //mono
       {
           out1[i] = 0.2 * ( *(data_ptr + data->offset) / 32767.0 ) + in1[i];
           out2[i] = out1[i] + in2[i];
           data->offset += 1;
           if( data->offset >= data->size )  data->offset = 0;
       }
       else  //stereo
       {
           //out1[i] = 0.2 * ( ( *(data_ptr + data->offset) / 65535.0 ) - 0.5 ) + in1[i];
           //out2[i] = 0.2 * ( ( *(data_ptr + data->offset + 1) / 65535.0 ) - 0.5 ) + in2[i];
           out1[i] = 0.2 * ( *(data_ptr + data->offset) / 32767.0 ) + in1[i];
           out2[i] = 0.2 * ( *(data_ptr + data->offset + 1) / 32767.0 ) + in2[i];
           data->offset += 2;
           if( ( data->offset / 2 ) >= data->size )  data->offset = 0;
       }
   }
    
	return 0;      
}

#ifdef JACK_TRANSPORT_TEST
int Jack_Sync_Callback(jack_transport_state_t state, jack_position_t *pos, void *arg)
{
    int res = 0;

    switch (state) {
        case JackTransportStarting:
            printf("JackTransportStarting...\n");
            break;
        case JackTransportRolling:
            printf("JackTransportRolling...\n");
            break;
        case JackTransportStopped:
            printf("JackTransportStopped...\n");
            break;
        default:
            break;
    }

    return res;
}
#endif

/**
 * JACK calls this shutdown_callback if the server ever shuts down or
 * decides to disconnect the client.
 */
void
jack_shutdown (void *arg)
{
   paLooperData *data = (paLooperData*)arg;
   if(data)
      free(data->ptr);
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

void getWaveFileInfo(char *file_path, wav_hdr *wavHeader)
{
   FILE *wavFile;
   int headerSize = sizeof(wav_hdr), filelength = 0;
   
   if((wavFile = fopen(file_path, "r")) == NULL)
   {
       printf("Can not able to open wave file\n");
       exit(1);
   }
   fread(wavHeader, headerSize, 1, wavFile);
   filelength = getFileSize(&wavFile);
   fclose(wavFile);
   printf("File is %d bytes.\n",filelength);
   printf("RIFF header                           :%c%c%c%c\n",wavHeader->RIFF[0],wavHeader->RIFF[1],wavHeader->RIFF[2],wavHeader->RIFF[3]);
   printf("WAVE header                           :%c%c%c%c\n",wavHeader->WAVE[0],wavHeader->WAVE[1],wavHeader->WAVE[2],wavHeader->WAVE[3]);
   printf("FMT                                   :%c%c%c%c\n",wavHeader->fmt[0],wavHeader->fmt[1],wavHeader->fmt[2],wavHeader->fmt[3]);
   printf("Data size (based on bits used)        :%ld\n",wavHeader->ChunkSize);

   // Display the sampling Rate form the header
   printf("Sampling Rate                         :%ld\n",wavHeader->SamplesPerSec); //Sampling frequency of the wav file
   printf("Number of bits used                   :%d\n",wavHeader->bitsPerSample);  //Number of bits used per sample
   printf("Number of channels                    :%d\n",wavHeader->NumOfChan);      //Number of channels (mono=1/stereo=2)
   printf("Number of bytes per second            :%ld\n",wavHeader->bytesPerSec);   //Number of bytes per second
   printf("data length                           :%ld\n",wavHeader->Subchunk2Size);

   return;
}

int
main (int argc, char *argv[])
{
/*
	const char **ports;
*/
	const char *client_name;
	const char *server_name = NULL;
	jack_options_t options = JackNullOption;
	jack_status_t status;
   paLooperData data;

   char *file_path;
   char *file_buffer;
   int file_size;

   if (argc >= 3)
   {
      client_name = argv[1];
      file_path   = argv[2];
   }
   else
   {
      fprintf (stderr, "Usage : jack_simple_looper <client_name> <file_name>\n");
      exit (1);
   }

   /* read wave info... */

   getWaveFileInfo(file_path, &wavHeader);
   if(wavHeader.bitsPerSample != 16)
   {
      fprintf (stderr, "Currently, supports 16 bits ber sample only\n");
      exit (1);
   }

   /* read file... */

   if((file_size = readWaveFileToMemory(file_path, &file_buffer)) <= 0)
   {
      fprintf (stderr, "Unable to open '%s'\n", file_path);
      exit (1);
   }

   data.ptr = file_buffer;
   data.size = file_size / ( wavHeader.NumOfChan * wavHeader.bitsPerSample / 8 );  //number of sample
   data.offset = 0;

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

	jack_set_process_callback (client, process, &data);

	/* tell the JACK server to call `jack_shutdown()' if
	   it ever shuts down, either entirely, or if it
	   just decides to stop calling us.
	*/

	jack_on_shutdown (client, jack_shutdown, &data);

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
/*
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
*/

#ifdef JACK_TRANSPORT_TEST
	if (jack_set_sync_callback(client, Jack_Sync_Callback, 0) != 0)
		printf("error while calling set_sync_callback...\n");
#endif

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
	#ifdef WIN32 
		Sleep(1000);
	#else
		sleep (1);
	#endif
	}

	jack_client_close (client);
	exit (0);
}
