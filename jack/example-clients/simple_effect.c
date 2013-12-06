/** @file simple_effect.c
 *
 * @brief simple effect for JACK
 *
 *  jackd -v -L 2 -d alsa -d hw:0,3 -D -r 44100 -p 1024
 *  jack_simple_looper l1 /data/drums_1.wav
 *  jack_simple_effect e1
 *
 *  jack_connect l1:output1 e1:input1
 *  jack_connect l1:output2 e1:input2
 *
 *  jack_connect e1:output1 system:playback_1
 *  jack_connect e1:output2 system:playback_2
 *
 *  //jack_connect e1:output1 loopback:playback_1
 *  //jack_connect e1:output2 loopback:playback_2
 *
 *  //jack_connect loopback:capture_1 e1:feedback1
 *  //jack_connect loopback:capture_2 e1:feedback2
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
jack_port_t *input_feedback_port1, *input_feedback_port2;
jack_client_t *client;

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
   jack_default_audio_sample_t *fb1, *fb2;
   int i;

	out1 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port1, nframes);
	out2 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port2, nframes);
   in1 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port1, nframes);
   in2 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port2, nframes);
   fb1 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_feedback_port1, nframes);
   fb2 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_feedback_port2, nframes);

	for( i=0; i<nframes; i++ )
   {
      out1[i] = in1[i] + ( fb1[i] * 0.7 );
      out2[i] = in2[i] + ( fb2[i] * 0.7 );
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
	exit (1);
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

   if (argc >= 2)
   {
      client_name = argv[1];
   }
   else
   {
      fprintf (stderr, "Usage : jack_simple_effect <client_name>\n");
      exit (1);
   }

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

	input_feedback_port1 = jack_port_register (client, "feedback1",
					  JACK_DEFAULT_AUDIO_TYPE,
					  JackPortIsInput, 0);

	input_feedback_port2 = jack_port_register (client, "feedback2",
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
*/
	if (jack_connect (client, jack_port_name (output_port1), "loopback:playback_1")) {
		fprintf (stderr, "cannot connect loopback output ports\n");
	}
	if (jack_connect (client, jack_port_name (output_port2), "loopback:playback_2")) {
		fprintf (stderr, "cannot connect loopback output ports\n");
	}
	if (jack_connect (client, "loopback:capture_1", jack_port_name (input_feedback_port1))) {
		fprintf (stderr, "cannot connect loopback input ports\n");
	}
	if (jack_connect (client, "loopback:capture_2", jack_port_name (input_feedback_port2))) {
		fprintf (stderr, "cannot connect loopback input ports\n");
	}
/*
	free (ports);
*/
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
