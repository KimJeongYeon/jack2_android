JACK Audio Connection Kit for Android
====
This project is JACK Audio Connection Kit for Android. (See also http://jackaudio.org/)
 - runs on latest android 4.4 platform
 - based on JACK2(jack-1.9.9.5)
 - support both ALSA and OpenSLES driver
 - support emulator

Newly released Samsung's Professional Audio SDK was based on JACK and is part of Samsung Mobile SDK.
For more information, visit http://developer.samsung.com/samsung-mobile-sdk

Notice :
Source code was retrieved from Samsung's Open Source Release Center(OSRC) at http://opensource.samsung.com/.
You can find them from 'MOBILE' menu -> 'Mobile Phone' -> 'SM-N9005'(SM-N9005\_KK\_Opensource\_Update5.zip) including build guide and requirements.

Requirements
----
 - ALSA user library(libasound.so) is required and available in "SM-N9005\_KK\_Opensource\_Update5.zip".
 - required root privilege to run jack on adb shell.

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
  - root@generic:/ # androidshmservice &
  - root@generic:/ # jackd -S -v -d opensles -C 0 -P 2 -r 44100 -p 1024 &
  - root@generic:/ # jack\_simple\_client &

Hisory
----
 - 24.Oct.2013 : first upload.
 - 18.Jan.2014 : code arranged, support KitKat and includes OpenSL ES driver.

Document will be updated...
