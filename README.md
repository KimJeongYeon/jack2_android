JACK Audio Connection Kit for Android
====
This project is JACK Audio Connection Kit for Android. (See also http://jackaudio.org/)
- Runs on latest android 4.4.2 platform
- Based on latest official JACK2(jack-1.9.9.5)
- Support both ALSA and OpenSLES driver
- Support emulator

Samsung's Professional Audio SDK was based on JACK and is part of Samsung Mobile SDK. For more information, visit http://developer.samsung.com/samsung-mobile-sdk

Notice :
Source code was retrieved from Samsung's <A HREF="http://opensource.samsung.com">Open Source Release Center(OSRC)</A>. You can find them from 'MOBILE' menu -> 'Mobile Phone' -> 'SM-N9005'(SM-N9005\_KK\_Opensource\_Update5.zip) including build guide and requirements. <B>This repository(<A HREF="https://github.com/KimJeongYeon/jack2_android">KimJeongYeon/jack2_android</A>) only sync latest jack of <A HREF="http://opensource.samsung.com">OSRC</A>, whereas personal development going on <A HREF="https://github.com/KimJeongYeon/jack2">KimJeongYeon/jack2</A>.</B>

How to build
----
I will introduce how to build jack for android emulator using partial build way.
- Requirements
    - Get full source code of android using repo sync. For more information, please visit <A HREF="http://source.android.com/source/building.html">HERE</A>.
    - alsa-lib is required and available in `SM-N9005_KK_Opensource_Update5.zip` also.
    - Required root privilege to run jack on adb shell.
- Build
    - Environment setup for android build(emulator):
    - `$ cd {YOUR_ANDROID_SOURCE_PATH}/build`
    - `$ source envsetup.sh`
    - `$ lunch aosp_arm-eng`
    - Build alsa-lib and jack:
        - Decompress `SM-N9005\_KK\_Opensource\_Update5.zip`, then `Platform.tar.gz`.
        - Copy `jack` and `alsa-lib` directory from `/SM-N9005\_KK\_Opensource\_Update5/vendor/samsung/common/external` to `{YOUR_ANDROID_SOURCE_PATH}/vendor/samsung/common/external`
        - `$ cd {YOUR_ANDROID_SOURCE_PATH}/vendor/samsung/common/external/alsa_lib`
        - `$ mma`
        - `$ cd {YOUR_ANDROID_SOURCE_PATH}/vendor/samsung/common/external/jack/android`
        - `$ mma`
    - If build done successfully, binaries placed at `{YOUR_ANDROID_SOURCE_PATH}/out/target/product/generic/system`. Also, prebuilt binaries could be find <A HREF="https://github.com/KimJeongYeon/jack2_android/tree/master/binaries">HERE</A>.

How to install
----
This project supports emulator which based on OpenSL ES as master driver with sound of course.
- Run emulator:
    - If you didn't install Android SDK, visit http://developer.android.com/sdk/index.html and install latest one.
    - `$ {YOUR_SDK_PATH}/tools/emulator -avd {YOUR\_AVD\_NAME} -wipe-data`
- Install binaries
    - From source code build:
        - `$ cd {YOUR_ANDROID_SOURCE_PATH}/out/target/product/generic/system`
    - From prebuilt binary:
        - `$ git clone https://github.com/KimJeongYeon/jack2_android.git`
        - `$ tar -xvzf ./jack2_android/binaries/jack2_android_binary_XXXXXXXX.tar.gz`
        - `$ cd jack2_android_binary_xxxxxxxx`
    - Push jack binaries to your emulator device using script:
        - run script `$ copy_target.sh`
```sh
#!/bin/sh

########################################
# push files to target
#
# how to run in adb shell:
#  > androidshmservice &
#  > jackd -S -v -d opensles -C 0 -P 2 -r 44100 -p 1024 &
#  > jack_simple_client &
########################################

COPY_PATH="."

adb shell mount -o remount,rw /system

adb shell mkdir /data/misc/jack
adb shell mkdir /system/lib/jack

adb push $COPY_PATH/lib/jack/jack_alsa.so /system/lib/jack
adb push $COPY_PATH/lib/jack/jack_dummy.so /system/lib/jack
adb push $COPY_PATH/lib/jack/jack_goldfish.so /system/lib/jack
adb push $COPY_PATH/lib/jack/jack_loopback.so /system/lib/jack
adb push $COPY_PATH/lib/jack/jack_net.so /system/lib/jack
adb push $COPY_PATH/lib/jack/jack_opensles.so /system/lib/jack
adb push $COPY_PATH/lib/jack/netmanager.so /system/lib/jack
adb push $COPY_PATH/lib/jack/profiler.so /system/lib/jack

adb push $COPY_PATH/lib/example_lib.so /system/lib
adb push $COPY_PATH/lib/libasound.so /system/lib
adb push $COPY_PATH/lib/libfluidsynth.so /system/lib
adb push $COPY_PATH/lib/libglib-2.0.so /system/lib
adb push $COPY_PATH/lib/libgthread-2.0.so /system/lib
adb push $COPY_PATH/lib/libjack.so /system/lib
adb push $COPY_PATH/lib/libjackserver.so /system/lib
adb push $COPY_PATH/lib/libjackshm.so /system/lib

adb push $COPY_PATH/bin/androidshmservice /system/bin
adb push $COPY_PATH/bin/shmservicedump /system/bin
adb push $COPY_PATH/bin/shmservicetest /system/bin
adb push $COPY_PATH/bin/jackd /system/bin

adb shell chmod 775 /system/bin/androidshmservice
adb shell chmod 775 /system/bin/shmservicedump
adb shell chmod 775 /system/bin/shmservicetest
adb shell chmod 775 /system/bin/jackd

adb push $COPY_PATH/xbin/jack_alias /system/xbin
adb push $COPY_PATH/xbin/jack_bufsize /system/xbin
adb push $COPY_PATH/xbin/jack_connect /system/xbin
adb push $COPY_PATH/xbin/jack_cpu /system/xbin
adb push $COPY_PATH/xbin/jack_cpu_load /system/xbin
adb push $COPY_PATH/xbin/jack_disconnect /system/xbin
adb push $COPY_PATH/xbin/jack_evmon /system/xbin
adb push $COPY_PATH/xbin/jack_freewheel /system/xbin
adb push $COPY_PATH/xbin/jack_iodelay /system/xbin
adb push $COPY_PATH/xbin/jack_latent_client /system/xbin
adb push $COPY_PATH/xbin/jack_load /system/xbin
adb push $COPY_PATH/xbin/jack_lsp /system/xbin
adb push $COPY_PATH/xbin/jack_metro /system/xbin
adb push $COPY_PATH/xbin/jack_midi_dump /system/xbin
adb push $COPY_PATH/xbin/jack_midi_latency_test /system/xbin
adb push $COPY_PATH/xbin/jack_midiseq /system/xbin
adb push $COPY_PATH/xbin/jack_midisine /system/xbin
adb push $COPY_PATH/xbin/jack_monitor_client /system/xbin
adb push $COPY_PATH/xbin/jack_multiple_metro /system/xbin
adb push $COPY_PATH/xbin/jack_samplerate /system/xbin
adb push $COPY_PATH/xbin/jack_server_control /system/xbin
adb push $COPY_PATH/xbin/jack_session_notify /system/xbin
adb push $COPY_PATH/xbin/jack_showtime /system/xbin
adb push $COPY_PATH/xbin/jack_simple_client /system/xbin
adb push $COPY_PATH/xbin/jack_simple_session_client /system/xbin
adb push $COPY_PATH/xbin/jack_test /system/xbin
adb push $COPY_PATH/xbin/jack_thru /system/xbin
adb push $COPY_PATH/xbin/jack_transport /system/xbin
adb push $COPY_PATH/xbin/jack_unload /system/xbin
adb push $COPY_PATH/xbin/jack_wait /system/xbin
adb push $COPY_PATH/xbin/jack_zombie /system/xbin

adb shell chmod 775 /system/xbin/jack_*
```

How to run
----
run adb shell then,
```
root@generic:/ # androidshmservice &
[1] 1249
root@generic:/ # 
root@generic:/ # jackd -S -v -d opensles -C 0 -P 2 -r 44100 -p 1024 &
[2] 1253
root@generic:/ # jackdmp 1.9.10
Copyright 2001-2005 Paul Davis and others.
Copyright 2004-2014 Grame.
jackdmp comes with ABSOLUTELY NO WARRANTY
This is free software, and you are welcome to redistribute it
under certain conditions; see the file COPYING for details

root@generic:/ # 
root@generic:/ # jack_simple_client &
[3] 1263
root@generic:/ # jack_lsp -c
system:playback_1
   jack_simple_client:output1
system:playback_2
   jack_simple_client:output2
jack_simple_client:output1
   system:playback_1
jack_simple_client:output2
   system:playback_2
this signal is 10 
```
