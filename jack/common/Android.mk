
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#ifeq ($(findstring -DSEC_JACKAUDIO, $(AUDIO_CFLAGS)), -DSEC_JACKAUDIO)

# ========================================================
# copy common source file
# ========================================================
common_libsource_server_dir = .server
common_libsource_client_dir = .client

$(shell rm -rf $(LOCAL_PATH)/$(common_libsource_server_dir))
$(shell rm -rf $(LOCAL_PATH)/$(common_libsource_client_dir))
$(shell mkdir $(LOCAL_PATH)/$(common_libsource_server_dir))
$(shell mkdir $(LOCAL_PATH)/$(common_libsource_client_dir))

$(shell cp -rf $(LOCAL_PATH)/JackActivationCount.cpp           $(LOCAL_PATH)/$(common_libsource_server_dir)/JackActivationCount.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackAPI.cpp                       $(LOCAL_PATH)/$(common_libsource_server_dir)/JackAPI.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackClient.cpp                    $(LOCAL_PATH)/$(common_libsource_server_dir)/JackClient.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackConnectionManager.cpp         $(LOCAL_PATH)/$(common_libsource_server_dir)/JackConnectionManager.cpp)
$(shell cp -rf $(LOCAL_PATH)/ringbuffer.c                      $(LOCAL_PATH)/$(common_libsource_server_dir)/ringbuffer.c)
$(shell cp -rf $(LOCAL_PATH)/JackError.cpp                     $(LOCAL_PATH)/$(common_libsource_server_dir)/JackError.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackException.cpp                 $(LOCAL_PATH)/$(common_libsource_server_dir)/JackException.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackFrameTimer.cpp                $(LOCAL_PATH)/$(common_libsource_server_dir)/JackFrameTimer.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackGraphManager.cpp              $(LOCAL_PATH)/$(common_libsource_server_dir)/JackGraphManager.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackPort.cpp                      $(LOCAL_PATH)/$(common_libsource_server_dir)/JackPort.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackPortType.cpp                  $(LOCAL_PATH)/$(common_libsource_server_dir)/JackPortType.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackAudioPort.cpp                 $(LOCAL_PATH)/$(common_libsource_server_dir)/JackAudioPort.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackMidiPort.cpp                  $(LOCAL_PATH)/$(common_libsource_server_dir)/JackMidiPort.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackMidiAPI.cpp                   $(LOCAL_PATH)/$(common_libsource_server_dir)/JackMidiAPI.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackEngineControl.cpp             $(LOCAL_PATH)/$(common_libsource_server_dir)/JackEngineControl.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackShmMem.cpp                    $(LOCAL_PATH)/$(common_libsource_server_dir)/JackShmMem.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackGenericClientChannel.cpp      $(LOCAL_PATH)/$(common_libsource_server_dir)/JackGenericClientChannel.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackGlobals.cpp                   $(LOCAL_PATH)/$(common_libsource_server_dir)/JackGlobals.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackDebugClient.cpp               $(LOCAL_PATH)/$(common_libsource_server_dir)/JackDebugClient.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackTransportEngine.cpp           $(LOCAL_PATH)/$(common_libsource_server_dir)/JackTransportEngine.cpp)
$(shell cp -rf $(LOCAL_PATH)/timestamps.c                      $(LOCAL_PATH)/$(common_libsource_server_dir)/timestamps.c)
$(shell cp -rf $(LOCAL_PATH)/JackTools.cpp                     $(LOCAL_PATH)/$(common_libsource_server_dir)/JackTools.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackMessageBuffer.cpp             $(LOCAL_PATH)/$(common_libsource_server_dir)/JackMessageBuffer.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackEngineProfiling.cpp           $(LOCAL_PATH)/$(common_libsource_server_dir)/JackEngineProfiling.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixThread.cpp      $(LOCAL_PATH)/$(common_libsource_server_dir)/JackPosixThread.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixSemaphore.cpp   $(LOCAL_PATH)/$(common_libsource_server_dir)/JackPosixSemaphore.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixProcessSync.cpp $(LOCAL_PATH)/$(common_libsource_server_dir)/JackPosixProcessSync.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixMutex.cpp       $(LOCAL_PATH)/$(common_libsource_server_dir)/JackPosixMutex.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackSocket.cpp           $(LOCAL_PATH)/$(common_libsource_server_dir)/JackSocket.cpp)
$(shell cp -rf $(LOCAL_PATH)/../linux/JackLinuxTime.c          $(LOCAL_PATH)/$(common_libsource_server_dir)/JackLinuxTime.c)

$(shell cp -rf $(LOCAL_PATH)/JackActivationCount.cpp           $(LOCAL_PATH)/$(common_libsource_client_dir)/JackActivationCount.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackAPI.cpp                       $(LOCAL_PATH)/$(common_libsource_client_dir)/JackAPI.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackClient.cpp                    $(LOCAL_PATH)/$(common_libsource_client_dir)/JackClient.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackConnectionManager.cpp         $(LOCAL_PATH)/$(common_libsource_client_dir)/JackConnectionManager.cpp)
$(shell cp -rf $(LOCAL_PATH)/ringbuffer.c                      $(LOCAL_PATH)/$(common_libsource_client_dir)/ringbuffer.c)
$(shell cp -rf $(LOCAL_PATH)/JackError.cpp                     $(LOCAL_PATH)/$(common_libsource_client_dir)/JackError.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackException.cpp                 $(LOCAL_PATH)/$(common_libsource_client_dir)/JackException.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackFrameTimer.cpp                $(LOCAL_PATH)/$(common_libsource_client_dir)/JackFrameTimer.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackGraphManager.cpp              $(LOCAL_PATH)/$(common_libsource_client_dir)/JackGraphManager.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackPort.cpp                      $(LOCAL_PATH)/$(common_libsource_client_dir)/JackPort.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackPortType.cpp                  $(LOCAL_PATH)/$(common_libsource_client_dir)/JackPortType.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackAudioPort.cpp                 $(LOCAL_PATH)/$(common_libsource_client_dir)/JackAudioPort.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackMidiPort.cpp                  $(LOCAL_PATH)/$(common_libsource_client_dir)/JackMidiPort.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackMidiAPI.cpp                   $(LOCAL_PATH)/$(common_libsource_client_dir)/JackMidiAPI.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackEngineControl.cpp             $(LOCAL_PATH)/$(common_libsource_client_dir)/JackEngineControl.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackShmMem.cpp                    $(LOCAL_PATH)/$(common_libsource_client_dir)/JackShmMem.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackGenericClientChannel.cpp      $(LOCAL_PATH)/$(common_libsource_client_dir)/JackGenericClientChannel.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackGlobals.cpp                   $(LOCAL_PATH)/$(common_libsource_client_dir)/JackGlobals.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackDebugClient.cpp               $(LOCAL_PATH)/$(common_libsource_client_dir)/JackDebugClient.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackTransportEngine.cpp           $(LOCAL_PATH)/$(common_libsource_client_dir)/JackTransportEngine.cpp)
$(shell cp -rf $(LOCAL_PATH)/timestamps.c                      $(LOCAL_PATH)/$(common_libsource_client_dir)/timestamps.c)
$(shell cp -rf $(LOCAL_PATH)/JackTools.cpp                     $(LOCAL_PATH)/$(common_libsource_client_dir)/JackTools.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackMessageBuffer.cpp             $(LOCAL_PATH)/$(common_libsource_client_dir)/JackMessageBuffer.cpp)
$(shell cp -rf $(LOCAL_PATH)/JackEngineProfiling.cpp           $(LOCAL_PATH)/$(common_libsource_client_dir)/JackEngineProfiling.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixThread.cpp      $(LOCAL_PATH)/$(common_libsource_client_dir)/JackPosixThread.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixSemaphore.cpp   $(LOCAL_PATH)/$(common_libsource_client_dir)/JackPosixSemaphore.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixProcessSync.cpp $(LOCAL_PATH)/$(common_libsource_client_dir)/JackPosixProcessSync.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackPosixMutex.cpp       $(LOCAL_PATH)/$(common_libsource_client_dir)/JackPosixMutex.cpp)
$(shell cp -rf $(LOCAL_PATH)/../posix/JackSocket.cpp           $(LOCAL_PATH)/$(common_libsource_client_dir)/JackSocket.cpp)
$(shell cp -rf $(LOCAL_PATH)/../linux/JackLinuxTime.c          $(LOCAL_PATH)/$(common_libsource_client_dir)/JackLinuxTime.c)

common_libsource_server := \
    $(common_libsource_server_dir)/JackActivationCount.cpp \
    $(common_libsource_server_dir)/JackAPI.cpp \
    $(common_libsource_server_dir)/JackClient.cpp \
    $(common_libsource_server_dir)/JackConnectionManager.cpp \
    $(common_libsource_server_dir)/ringbuffer.c \
    $(common_libsource_server_dir)/JackError.cpp \
    $(common_libsource_server_dir)/JackException.cpp \
    $(common_libsource_server_dir)/JackFrameTimer.cpp \
    $(common_libsource_server_dir)/JackGraphManager.cpp \
    $(common_libsource_server_dir)/JackPort.cpp \
    $(common_libsource_server_dir)/JackPortType.cpp \
    $(common_libsource_server_dir)/JackAudioPort.cpp \
    $(common_libsource_server_dir)/JackMidiPort.cpp \
    $(common_libsource_server_dir)/JackMidiAPI.cpp \
    $(common_libsource_server_dir)/JackEngineControl.cpp \
    $(common_libsource_server_dir)/JackShmMem.cpp \
    $(common_libsource_server_dir)/JackGenericClientChannel.cpp \
    $(common_libsource_server_dir)/JackGlobals.cpp \
    $(common_libsource_server_dir)/JackDebugClient.cpp \
    $(common_libsource_server_dir)/JackTransportEngine.cpp \
    $(common_libsource_server_dir)/timestamps.c \
    $(common_libsource_server_dir)/JackTools.cpp \
    $(common_libsource_server_dir)/JackMessageBuffer.cpp \
    $(common_libsource_server_dir)/JackEngineProfiling.cpp \
    $(common_libsource_server_dir)/JackPosixThread.cpp \
    $(common_libsource_server_dir)/JackPosixSemaphore.cpp \
    $(common_libsource_server_dir)/JackPosixProcessSync.cpp \
    $(common_libsource_server_dir)/JackPosixMutex.cpp \
    $(common_libsource_server_dir)/JackSocket.cpp \
    $(common_libsource_server_dir)/JackLinuxTime.c

common_libsource_client := \
    $(common_libsource_client_dir)/JackActivationCount.cpp \
    $(common_libsource_client_dir)/JackAPI.cpp \
    $(common_libsource_client_dir)/JackClient.cpp \
    $(common_libsource_client_dir)/JackConnectionManager.cpp \
    $(common_libsource_client_dir)/ringbuffer.c \
    $(common_libsource_client_dir)/JackError.cpp \
    $(common_libsource_client_dir)/JackException.cpp \
    $(common_libsource_client_dir)/JackFrameTimer.cpp \
    $(common_libsource_client_dir)/JackGraphManager.cpp \
    $(common_libsource_client_dir)/JackPort.cpp \
    $(common_libsource_client_dir)/JackPortType.cpp \
    $(common_libsource_client_dir)/JackAudioPort.cpp \
    $(common_libsource_client_dir)/JackMidiPort.cpp \
    $(common_libsource_client_dir)/JackMidiAPI.cpp \
    $(common_libsource_client_dir)/JackEngineControl.cpp \
    $(common_libsource_client_dir)/JackShmMem.cpp \
    $(common_libsource_client_dir)/JackGenericClientChannel.cpp \
    $(common_libsource_client_dir)/JackGlobals.cpp \
    $(common_libsource_client_dir)/JackDebugClient.cpp \
    $(common_libsource_client_dir)/JackTransportEngine.cpp \
    $(common_libsource_client_dir)/timestamps.c \
    $(common_libsource_client_dir)/JackTools.cpp \
    $(common_libsource_client_dir)/JackMessageBuffer.cpp \
    $(common_libsource_client_dir)/JackEngineProfiling.cpp \
    $(common_libsource_client_dir)/JackPosixThread.cpp \
    $(common_libsource_client_dir)/JackPosixSemaphore.cpp \
    $(common_libsource_client_dir)/JackPosixProcessSync.cpp \
    $(common_libsource_client_dir)/JackPosixMutex.cpp \
    $(common_libsource_client_dir)/JackSocket.cpp \
    $(common_libsource_client_dir)/JackLinuxTime.c

server_libsource := \
    JackAudioDriver.cpp \
    JackTimedDriver.cpp \
    JackMidiDriver.cpp \
    JackDriver.cpp \
    JackEngine.cpp \
    JackExternalClient.cpp \
    JackFreewheelDriver.cpp \
    JackInternalClient.cpp \
    JackServer.cpp \
    JackThreadedDriver.cpp \
    JackRestartThreadedDriver.cpp \
    JackWaitThreadedDriver.cpp \
    JackServerAPI.cpp \
    JackDriverLoader.cpp \
    JackServerGlobals.cpp \
    JackControlAPI.cpp \
    JackNetTool.cpp \
    JackNetInterface.cpp \
    JackArgParser.cpp \
    JackRequestDecoder.cpp \
    JackMidiAsyncQueue.cpp \
    JackMidiAsyncWaitQueue.cpp \
    JackMidiBufferReadQueue.cpp \
    JackMidiBufferWriteQueue.cpp \
    JackMidiRawInputWriteQueue.cpp \
    JackMidiRawOutputWriteQueue.cpp \
    JackMidiReadQueue.cpp \
    JackMidiReceiveQueue.cpp \
    JackMidiSendQueue.cpp \
    JackMidiUtil.cpp \
    JackMidiWriteQueue.cpp \
    ../posix/JackSocketServerChannel.cpp \
    ../posix/JackSocketNotifyChannel.cpp \
    ../posix/JackSocketServerNotifyChannel.cpp \
    ../posix/JackNetUnixSocket.cpp

net_libsource := \
    JackNetAPI.cpp \
    JackNetInterface.cpp \
    JackNetTool.cpp \
    JackException.cpp \
    JackAudioAdapterInterface.cpp \
    JackLibSampleRateResampler.cpp \
    JackResampler.cpp \
    JackGlobals.cpp \
    ../posix/JackPosixMutex.cpp \
    ringbuffer.c \
    ../posix/JackNetUnixSocket.cpp \
    ../posix/JackPosixThread.cpp \
    ../linux/JackLinuxTime.c

client_libsource := \
    JackLibClient.cpp \
    JackLibAPI.cpp \
    ../posix/JackSocketClientChannel.cpp \
    ../posix/JackPosixServerLaunch.cpp

netadapter_libsource := \
    JackResampler.cpp \
    JackLibSampleRateResampler.cpp \
    JackAudioAdapter.cpp \
    JackAudioAdapterInterface.cpp \
    JackNetAdapter.cpp

audioadapter_libsource := \
    JackResampler.cpp \
    JackLibSampleRateResampler.cpp \
    JackAudioAdapter.cpp \
    JackAudioAdapterInterface.cpp \
    JackAudioAdapterFactory.cpp \
    ../linux/alsa/JackAlsaAdapter.cpp

common_c_includes := \
    $(JACK_ROOT) \
    $(JACK_ROOT)/common \
    $(JACK_ROOT)/common/android \
    $(JACK_ROOT)/common/jack \
    $(JACK_ROOT)/linux \
    $(JACK_ROOT)/linux/alsa \
    $(JACK_ROOT)/posix \
    $(JACK_ROOT)/android \
    $(JACK_STL_INCLUDES)

common_cflags := -O0 -g -Wall -fexceptions -fvisibility=hidden -DHAVE_CONFIG_H
common_cflags += -Wno-unused -Wno-sign-compare -Wno-deprecated-declarations -Wno-cpp
common_cppflags := -frtti -Wno-sign-promo -fcheck-new

# ========================================================
# libjackserver.so
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_libsource_server) $(server_libsource)
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_CPPFLAGS := $(common_cppflags)
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libjackshm
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := libjackserver
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

## ========================================================
## libjacknet.so
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := $(net_libsource)
#LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
#LOCAL_CPPFLAGS := $(common_cppflags)
##to avoid __cxa_XXXX errors
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libsamplerate
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := libjacknet
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)

# ========================================================
# libjack.so
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_libsource_client) $(client_libsource)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_CPPFLAGS := $(common_cppflags)
#to avoid __cxa_XXXX errors
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libjackshm
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := libjack
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# ========================================================
# netmanager.so
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := JackNetManager.cpp
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_CPPFLAGS := $(common_cppflags)
#to avoid __cxa_XXXX errors
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := netmanager
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# ========================================================
# profiler.so
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := JackProfiler.cpp
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_CPPFLAGS := $(common_cppflags)
#to avoid __cxa_XXXX errors
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := profiler
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

## ========================================================
## netadapter.so
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := $(netadapter_libsource)
#LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
#LOCAL_CPPFLAGS := $(common_cppflags)
##to avoid __cxa_XXXX errors
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libsamplerate libjackserver
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := netadapter
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)

## ========================================================
## audioadapter.so
## ========================================================
#ifeq ($(SUPPORT_ALSA_IN_JACK),true)
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := $(audioadapter_libsource)
#LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE -D_POSIX_SOURCE
#LOCAL_CPPFLAGS := $(common_cppflags)
##to avoid __cxa_XXXX errors
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include $(ALSA_INCLUDES)
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libasound libsamplerate libjackserver
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := audioadapter
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)
##endif
#endif

# ========================================================
# Porting Note
# ========================================================
#
# 1) source code located at:
#    android/external/Jack/...
#
# 2) obj files were located at:
#    out/target/product/GT-N7000/obj/SHARED_LIBRARIES/...
#
# 3) all C++ sources are compiled with -fno-exceptions support by default
#    - currently, not support exceptions
#    - to enable it, use the '-fexceptions' C++ compiler flag.
#
# 4) to solve __cxa_~~~ errors at linking step.
#    - alternatively, use statically built stdc++ library
#      http://www.crystax.net/android/ndk-r5.php
#      android-ndk-r5-crystax-1.beta3/sources/cxx-stl/gnu-libstdc++/libs/armeabi/libstdc++.a
#    - use libcrystax.a library
# 
# 5) all pthread operations (with a few exceptions) are included in the Android C library.
#    this is why there is no libpthread.so and no librt.so
#
# 6) CAS(compare and swap) function needed.
#    - refer android/bionic/libc/arch-arm/bionic/atomics_arm.S
#    - currently implemented as c language
#
# 7) bionic c doesn't support some pthread functions:
#    - refer android/bionic/libc/docs/OVERVIEW.TXT
#    - pthread_setcanceltype(), pthread_attr_setinheritsched(), pthread_cancel() didn't exist in bionic
#    - pthread_cancel() seems should be replaced by pthread_kill()
#    - refer below article:
#    - work around on pthread_cancel for android boinic
#    - http://igourd.blogspot.kr/2009/05/work-around-on-pthreadcancel-for.html
#
# 8) Android does not support System V IPCs
#    - refer android/bionic/libc/docs/SYSV-IPC.TXT
#    - semaphore('semget', 'semop') was replaced by mutex('pthread_mutex_lock', 'pthread_mutex_unlock')
#    - shared memory('shm_open', 'shm_unlink') was replaced by ASHMEM
#
# 9) some mman functions doesn't exist:
#    - mlockall(), munlockall()
#    - currently not used
#
# 10) libsamplerate required
#    - Sample Rate Converter for audio
#    - http://www.mega-nerd.com/SRC/

