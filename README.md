JACK Audio Connection Kit for Android
====
This project is JACK Audio Connection Kit for Android. (See also http://jackaudio.org/)
 - runs on android 4.4 platform(KitKat)
 - based on JACK2(jack-1.9.9.5)
 - support both alsa and OpenSL ES driver
 - support emulator

Newly released Samsung's Professional Audio SDK was based on JACK and is part of Samsung Mobile SDK.
For more information, visit http://developer.samsung.com/samsung-mobile-sdk

Notice :
Source code was retrieved from Samsung's Open Source Release Center(OSRC) at http://opensource.samsung.com/.
You can find them from 'MOBILE' menu -> 'Mobile Phone' -> 'SM-N9005'(SM-N9005\_KK\_Opensource\_Update5.zip) including build guide and requirements.

Requirements
----
 - Alsa user library(libasound.so) is required and available in "SM-N9005\_KK\_Opensource\_Update5.zip".
 - required root privilege to run jack on adb shell.

How to run
----
jack2_android supports emulator with sound using qemu's audio driver. Therefore you able to run jack server & applications without real target.
 1. prepare to install Android's SDK which have emulator.
 2. download /binaries/jack2_android_binary_xxxxxxxx.tar.gz from github.
 3. run emulator
 4. run script 'copy_target.sh' for copying libraries and executive files. (if you don't have write permission, copy system.img file to your ~/.android/avd/[NAME].avd)
 5. run adb shell
   1. # stop media
   2. # androidshmservice &
   3. # jackd -v -d goldfish &
   4. # jack_simple_client &

Hisory
----
 - 24.Oct.2013 : first upload.
 - 18.Jan.2014 : code arranged, support KitKat and includes OpenSL ES driver.

Document will be updated...
