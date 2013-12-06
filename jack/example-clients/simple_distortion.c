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

#define max(x,y) (((x)>(y)) ? (x) : (y))
#define min(x,y) (((x)<(y)) ? (x) : (y))

int fSamplingFreq;
float drive;
       float overdrive4;

	float 	fslider5;
	float 	fslider4;
	float 	fVec5[2];
	float 	fRec0[2];
	float 	fslider6;
	float 	fentry0;
	float 	fConst0;
	float 	fVec1[2];
	float 	fRec3[2];
	float 	fentry1;
	float 	fcheckbox0;
	float 	fslider0;
	int 	IOTA;
	float 	fVec0[4096];
	float 	fslider1;
	float 	fRec1[2];

	float 	fConst1;
	float 	fConst2;
	float 	fVec2[2];
	float 	fRec2[2];
	float 	fslider2;
	float 	fslider3;
	float 	fVec3[2];
	float 	fRec7[2];
	float 	fVec4[2];
	float 	fRec6[2];
	float 	fRec5[3];
	float 	fRec4[3];
	float 	fcheckbox1;
	float 	fRec8[2];
	float 	fVec6[2];
	float 	fRec12[2];
	float 	fVec7[2];
	float 	fRec11[2];
	float 	fRec10[3];
	float 	fRec9[3];
	float 	fRecover0[2];

void instanceinit(int samplingFreq) {
	int i = 0;
	fSamplingFreq = samplingFreq;
			fslider0 = 0.12f;
			IOTA = 0;
			for (i=0; i<4096; i++) fVec0[i] = 0;
			fslider1 = 0.5f;
			for (i=0; i<2; i++) fRec1[i] = 0;
			fentry0 = 5000.0f;
			fConst0 = (3.141593f / fSamplingFreq);
			for (i=0; i<2; i++) fVec1[i] = 0;
			for (i=0; i<2; i++) fRec3[i] = 0;
			fentry1 = 130.0f;
			fConst1 = (3.141593f * fSamplingFreq);
			fConst2 = (0.5f / fSamplingFreq);
			for (i=0; i<2; i++) fVec2[i] = 0;
			for (i=0; i<2; i++) fRec2[i] = 0;
			fcheckbox0 = 1.0;
			fslider2 = 5000.0f;
			fslider3 = 130.0f;
			for (i=0; i<2; i++) fVec3[i] = 0;
			for (i=0; i<2; i++) fRec7[i] = 0;
			for (i=0; i<2; i++) fVec4[i] = 0;
			for (i=0; i<2; i++) fRec6[i] = 0;
			for (i=0; i<3; i++) fRec5[i] = 0;
			for (i=0; i<3; i++) fRec4[i] = 0;
			fcheckbox1 = 1.0;
			fslider4 = 0.0f;
			fslider5 = 0.64f;
			for (i=0; i<2; i++) fVec5[i] = 0;
			for (i=0; i<2; i++) fRec0[i] = 0;
			fslider6 = 0.0f;
			for (i=0; i<2; i++) fRec8[i] = 0;
			for (i=0; i<2; i++) fVec6[i] = 0;
			for (i=0; i<2; i++) fRec12[i] = 0;
			for (i=0; i<2; i++) fVec7[i] = 0;
			for (i=0; i<2; i++) fRec11[i] = 0;
			for (i=0; i<3; i++) fRec10[i] = 0;
			for (i=0; i<3; i++) fRec9[i] = 0;
			drive = 0.0f;
			overdrive4 = 0.0;
			for (i=0; i<2; i++) fRecover0[i] = 0;
}

void compute (int count, float** input, float** output) {
			float 	fSlow0 = (1.0f - fslider0);
			float 	fSlow1 = fslider1;
			int 	iSlow2 = (int)(((int)((fSlow1 - 1)) & 4095));
			int 	iSlow3 = (int)(((int)(fSlow1) & 4095));
			float 	fSlow4 = (1.0f / tanf((fConst0 * fentry0)));
			float 	fSlow5 = (fSlow4 - 1);
			float 	fSlow6 = (1.0f / (1 + fSlow4));
			float 	fSlow7 = (1.0f / tanf((fConst2 * (fConst1 - (6.283185f * fentry1)))));
			float 	fSlow8 = (1 + fSlow7);
			float 	fSlow9 = (1.0f / fSlow8);
			float 	fSlow10 = (0 - ((fSlow7 - 1) / fSlow8));
			int 	iSlow11 = (int)(fcheckbox0);
			float 	fSlow12 = tanf((fConst0 * fslider2));
			float 	fSlow13 = (2 * (1 - (1.0f / (fSlow12 * fSlow12))));
			float 	fSlow14 = (1.0f / fSlow12);
			float 	fSlow15 = (1 + ((fSlow14 - 0.765367f) / fSlow12));
			float 	fSlow16 = (1.0f / (1 + ((0.765367f + fSlow14) / fSlow12)));
			float 	fSlow17 = (1 + ((fSlow14 - 1.847759f) / fSlow12));
			float 	fSlow18 = (1.0f / (1 + ((1.847759f + fSlow14) / fSlow12)));
			float 	fSlow19 = (fConst0 * fslider3);
			float 	fSlow20 = (1.0f / (1 + fSlow19));
			float 	fSlow21 = (1 - fSlow19);
			int 	iSlow22 = (int)(fcheckbox1);
			float 	fSlow23 = fslider4;
	                float drivem1 = drive - 1.0f;
			float 	fSlow24 = powf(10.0f, (2 * fslider5));
			float 	fSlow25 = (9.999871e-04f * powf(10, (5.000000e-02f * (fslider6 - 10))));
	   		float fSlowover0 = (9.999871e-04f * powf(10, (5.000000e-02f * (drive*-0.5))));
			float* input0 = input[0];
			float* output0 = output[0];
			int i = 0;
			for (i=0; i<count; i++) {
				float 	S0[2];
				float 	S1[2];
				float 	S2[2];
				float fTempi0 = input0[i];
				if (overdrive4 == 1.0)     // overdrive
                		{
		    			float fTempdr0 = fTempi0 ; 
		    			float fTempdr1 = fabs(fTempdr0);
		    			fRecover0[0] = (fSlowover0 + (0.999000f * fRecover0[1]));
		    			fTempi0 = (fTempdr0*(fTempdr1 + drive)/(fTempdr0*fTempdr0 + drivem1*fTempdr1 + 1.0f))*fRecover0[0];
				} 
				float fTemp0 = (fTempi0 + (fSlow0 * fRec1[1]));
				fVec0[IOTA&4095] = fTemp0;
				fRec1[0] = (0.5f * (fVec0[(IOTA-iSlow3)&4095] + fVec0[(IOTA-iSlow2)&4095]));
				S2[0] = fRec1[0];
				fVec1[0] = (fSlow6 * fRec1[0]);
				fRec3[0] = (fVec1[1] + (fSlow6 * (fRec1[0] + (fSlow5 * fRec3[1]))));
				float fTemp1 = (fSlow9 * fRec3[0]);
				fVec2[0] = fTemp1;
				fRec2[0] = ((fVec2[0] + (fSlow10 * fRec2[1])) - fVec2[1]);
				S2[1] = fRec2[0];
				float fTemp2 = S2[iSlow11];
				S1[0] = fTemp2;
				fVec3[0] = (fSlow20 * fTemp2);
				fRec7[0] = ((fSlow20 * (fTemp2 + (fSlow21 * fRec7[1]))) - fVec3[1]);
				fVec4[0] = (fSlow20 * fRec7[0]);
				fRec6[0] = ((fSlow20 * (fRec7[0] + (fSlow21 * fRec6[1]))) - fVec4[1]);
				fRec5[0] = (fRec6[0] - (fSlow18 * ((fSlow17 * fRec5[2]) + (fSlow13 * fRec5[1]))));
				fRec4[0] = ((fSlow18 * (fRec5[2] + (fRec5[0] + (2 * fRec5[1])))) - (fSlow16 * ((fSlow15 * fRec4[2]) + (fSlow13 * fRec4[1]))));
				S1[1] = (fSlow16 * (fRec4[2] + (fRec4[0] + (2 * fRec4[1]))));
				float fTemp3 = max(-1, min(1, (fSlow24 * (fSlow23 + S1[iSlow22]))));
				float fTemp4 = (fTemp3 * (1 - (0.333333f * (fTemp3 * fTemp3))));
				fVec5[0] = fTemp4;
				fRec0[0] = ((fVec5[0] + (0.995f * fRec0[1])) - fVec5[1]);
				fRec8[0] = (fSlow25 + (0.999f * fRec8[1]));
				float fTemp5 = (fRec8[0] * fRec0[0]);
				S0[0] = fTemp5;
				fVec6[0] = (fSlow20 * fTemp5);
				fRec12[0] = ((fSlow20 * (fTemp5 + (fSlow21 * fRec12[1]))) - fVec6[1]);
				fVec7[0] = (fSlow20 * fRec12[0]);
				fRec11[0] = ((fSlow20 * (fRec12[0] + (fSlow21 * fRec11[1]))) - fVec7[1]);
				fRec10[0] = (fRec11[0] - (fSlow18 * ((fSlow17 * fRec10[2]) + (fSlow13 * fRec10[1]))));
				fRec9[0] = ((fSlow18 * (fRec10[2] + (fRec10[0] + (2 * fRec10[1])))) - (fSlow16 * ((fSlow15 * fRec9[2]) + (fSlow13 * fRec9[1]))));
				S0[1] = (fSlow16 * (fRec9[2] + (fRec9[0] + (2 * fRec9[1]))));
				output0[i] = S0[iSlow22];
				// post processing
				fRec9[2] = fRec9[1]; fRec9[1] = fRec9[0];
				fRec10[2] = fRec10[1]; fRec10[1] = fRec10[0];
				fRec11[1] = fRec11[0];
				fVec7[1] = fVec7[0];
				fRec12[1] = fRec12[0];
				fVec6[1] = fVec6[0];
				fRec8[1] = fRec8[0];
				fRec0[1] = fRec0[0];
				fVec5[1] = fVec5[0];
				fRec4[2] = fRec4[1]; fRec4[1] = fRec4[0];
				fRec5[2] = fRec5[1]; fRec5[1] = fRec5[0];
				fRec6[1] = fRec6[0];
				fVec4[1] = fVec4[0];
				fRec7[1] = fRec7[0];
				fVec3[1] = fVec3[0];
				fRec2[1] = fRec2[0];
				fVec2[1] = fVec2[0];
				fRec3[1] = fRec3[0];
				fVec1[1] = fVec1[0];
				fRec1[1] = fRec1[0];
				fRecover0[1] = fRecover0[0];
				IOTA = IOTA+1;
			}
		} 

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
	printf("process is called\n");
	jack_default_audio_sample_t *out1, *out2, *in1, *in2;
   jack_default_audio_sample_t *fb1, *fb2;
   //int i;

	out1 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port1, nframes);
	out2 = (jack_default_audio_sample_t*)jack_port_get_buffer (output_port2, nframes);
   in1 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port1, nframes);
   in2 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_port2, nframes);
   //fb1 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_feedback_port1, nframes);
   //fb2 = (jack_default_audio_sample_t*)jack_port_get_buffer (input_feedback_port2, nframes);

   //for( i=0; i<nframes; i++ )
   //{
   //   out1[i] = in1[i] + ( fb1[i] * 0.7 );
   //   out2[i] = in2[i] + ( fb2[i] * 0.7 );
   //}
   //fslider0 = 0.0f;
   //fslider1 = 0.0f;
   compute(nframes, &in1, &out1);
   //fslider0 = 1500.0f;
   //fslider1 = 90.0f;
   //compute(nframes, &in2, &out2);
    
	return 0;      
}

/**
 * JACK calls this shutdown_callback if the server ever shuts down or
 * decides to disconnect the client.
 */
void
jack_shutdown (void * arg)
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

	
	instanceinit(44100);
	
	
   if (argc >= 2)
   {
      client_name = argv[1];
      
      if(argc >= 3) drive = (float)atoi(argv[2]);
      if(argc >= 4) overdrive4 = (float)atoi(argv[3]);
      
      if(argc >= 5) fslider5 = (float)atoi(argv[4]);
      if(argc >= 6) fslider4 = (float)atoi(argv[5]);
      if(argc >= 7) fslider6 = (float)atoi(argv[6]);
      
      if(argc >= 8) fentry1 = (float)atoi(argv[7]);
      if(argc >= 9) fentry0 = (float)atoi(argv[8]);
      
      if(argc >= 10) fcheckbox0 = (float)atoi(argv[9]);
      
      if(argc >= 11) fslider2 = (float)atoi(argv[10]);
      if(argc >= 12) fslider3 = (float)atoi(argv[11]);
      if(argc >= 13) fcheckbox1 = (float)atoi(argv[12]);
      
      if(argc >= 14) fslider0 = (float)atoi(argv[13]);
      if(argc >= 15) fslider1 = (float)atoi(argv[14]);
   }
   else
   {
      fprintf (stderr, "Usage : jack_simple_effect <client_name> <overdriver:1~20> <driverover:0~1> <drive:0~1> <drivelevel1:0~1> <drivegain:-20~20> <highpass:8~1000> <lowpass:1000~10000> <low_highpass:0~1> <highcut:1000~10000> <lowcut:8~1000> <low_highcut:0~1> <trigger:0~1> <vibrato:0.01~1>\n");
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

	//input_feedback_port1 = jack_port_register (client, "feedback1",
	//				  JACK_DEFAULT_AUDIO_TYPE,
	//				  JackPortIsInput, 0);

	//input_feedback_port2 = jack_port_register (client, "feedback2",
	//				  JACK_DEFAULT_AUDIO_TYPE,
	//				  JackPortIsInput, 0);

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
	//if (jack_connect (client, jack_port_name (output_port1), "loopback:playback_1")) {
	//	fprintf (stderr, "cannot connect loopback output ports\n");
	//}
	//if (jack_connect (client, jack_port_name (output_port2), "loopback:playback_2")) {
	//	fprintf (stderr, "cannot connect loopback output ports\n");
	//}
	//if (jack_connect (client, "loopback:capture_1", jack_port_name (input_feedback_port1))) {
	//	fprintf (stderr, "cannot connect loopback input ports\n");
	//}
	//if (jack_connect (client, "loopback:capture_2", jack_port_name (input_feedback_port2))) {
	//	fprintf (stderr, "cannot connect loopback input ports\n");
	//}
	
	if (jack_connect (client, "simple_looper:output1", jack_port_name (input_port1))) {
		fprintf (stderr, "cannot connect loopback input ports\n");
	}
	if (jack_connect (client, "simple_looper:output2", jack_port_name (input_port2))) {
		fprintf (stderr, "cannot connect loopback input ports\n");
	}
	if (jack_connect (client, jack_port_name (output_port1), "system:playback_1")) {
		fprintf (stderr, "cannot connect loopback output ports\n");
	}
	if (jack_connect (client, jack_port_name (output_port2), "system:playback_2")) {
		fprintf (stderr, "cannot connect loopback output ports\n");
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
