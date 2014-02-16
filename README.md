JACK Audio Connection Kit for Android
====
This project is JACK Audio Connection Kit for Android. (See also http://jackaudio.org/)
 - Runs on latest android 4.4.2 platform
 - Based on latest official JACK2(jack-1.9.9.5)
 - Support both ALSA and OpenSLES driver
 - Support emulator

Newly released Samsung's Professional Audio SDK was based on JACK and is part of Samsung Mobile SDK.
For more information, visit http://developer.samsung.com/samsung-mobile-sdk

Notice :
Source code was retrieved from Samsung's <A HREF="http://opensource.samsung.com">Open Source Release Center(OSRC)</A>.
You can find them from 'MOBILE' menu -> 'Mobile Phone' -> 'SM-N9005'(SM-N9005\_KK\_Opensource\_Update5.zip) including build guide and requirements.
<B>This repository(<A HREF="https://github.com/KimJeongYeon/jack2_android">KimJeongYeon/jack2_android</A>) only sync latest jack of <A HREF="http://opensource.samsung.com">OSRC</A>, whereas personal development going on <A HREF="https://github.com/KimJeongYeon/jack2">KimJeongYeon/jack2</A>.</B>

How to build
----
I introduce how to build jack for android emulator using partial build way(not full build).
 1. Requirements
  1. Get full source code of android using repo sync. For more information, please visit <A HREF="http://source.android.com/source/building.html">HERE</A>.
  2. ALSA user library(libasound.so) is required and available in "SM-N9005\_KK\_Opensource\_Update5.zip" also.
  3. Required root privilege to run jack on adb shell.
 2. Build
  1. Environment setup for android build(emulator):
   - $ cd {YOUR_ANDROID_SOURCE_PATH}/build
   - $ source envsetup.sh
   - $ lunch aosp_arm-eng
  2. Build alsa-lib and jack:
   - Decompress 'SM-N9005\_KK\_Opensource\_Update5.zip', then 'Platform.tar.gz'.
   - Copy 'jack' and 'alsa-lib' dorectory from /SM-N9005\_KK\_Opensource\_Update5/vendor/samsung/common/external to {YOUR_ANDROID_SOURCE_PATH}/vendor/samsung/common/external
   - $ cd {YOUR_ANDROID_SOURCE_PATH}/vendor/samsung/common/external/alsa_lib
   - $ mma
   - $ cd {YOUR_ANDROID_SOURCE_PATH}/vendor/samsung/common/external/jack/android
   - $ mma
 3. If build has done successfully, binaries placed {YOUR_ANDROID_SOURCE_PATH}/out/target/product/generic/system. 

How to run
----
jack2_android supports emulator with sound using qemu's audio driver. Therefore you able to run jack server & applications without real target. If you don't have android build system, refer step-by-step with binaries first:
 1. before to run...
  1. visit http://developer.android.com/sdk/index.html and download & install latest Android SDK.
  2. download jack binaries:
   - $ git clone https://github.com/KimJeongYeon/jack2_android.git
   - copy & decompress 'jack2\_android/binaries/jack2\_android\_binary_xxxxxxxx.tar.gz' to your working directory.
 2. run emulator & run copy script for pushing binaries to your emulator device.
  - $ {YOUR_SDK_PATH}/tools/emulator -avd {YOUR\_AVD\_NAME} -wipe-data
  - $ copy_target.sh
 3. run jack world!
  - $ adb shell
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
