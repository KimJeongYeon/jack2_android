
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#ifeq ($(findstring -DSEC_JACKAUDIO, $(AUDIO_CFLAGS)), -DSEC_JACKAUDIO)

common_c_includes := \
    $(JACK_ROOT) \
    $(JACK_ROOT)/common \
    $(JACK_ROOT)/common/android \
    $(JACK_ROOT)/common/jack \
    $(JACK_ROOT)/linux \
    $(JACK_ROOT)/posix \
    $(JACK_ROOT)/dbus \
    $(JACK_STL_INCLUDES)

common_cflags := -O0 -g -Wall -fexceptions -DHAVE_CONFIG_H
common_cflags += -Wno-unused -Wno-sign-compare

# ========================================================
# jackd
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    ../common/Jackdmp.cpp
#    ../dbus/reserve.c
#    ../dbus/audio_reserve.c
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS) -ldl -Wl,--no-fatal-warnings
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libutils libjackserver
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jackd
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# driver - dummy
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := ../common/JackDummyDriver.cpp
#'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_dummy
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# ========================================================
# driver - alsa
# ========================================================
ifeq ($(SUPPORT_ALSA_IN_JACK),true)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    alsa/JackAlsaDriver.cpp \
    alsa/alsa_rawmidi.c \
    alsa/alsa_seqmidi.c \
    alsa/alsa_midi_jackmp.cpp \
    ../common/memops.c \
    alsa/generic_hw.c \
    alsa/hdsp.c \
    alsa/alsa_driver.c \
    alsa/hammerfall.c \
    alsa/ice1712.c
#'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE -D_POSIX_SOURCE
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes) $(ALSA_INCLUDES)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver libasound
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_alsa
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)
endif

## ========================================================
## driver - alsarawmidi
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := \
#    alsarawmidi/JackALSARawMidiDriver.cpp \
#    alsarawmidi/JackALSARawMidiInputPort.cpp \
#    alsarawmidi/JackALSARawMidiOutputPort.cpp \
#    alsarawmidi/JackALSARawMidiPort.cpp \
#    alsarawmidi/JackALSARawMidiReceiveQueue.cpp \
#    alsarawmidi/JackALSARawMidiSendQueue.cpp \
#    alsarawmidi/JackALSARawMidiUtil.cpp
##'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
#LOCAL_CFLAGS := $(common_cflags) -D_POSIX_SOURCE -D__ALSA_RAWMIDI_H
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes) $(ALSA_INCLUDES)
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver libasound
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_alsarawmidi
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)

## LIBFREEBOB required
## ========================================================
## driver - freebob
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := freebob/JackFreebobDriver.cpp
##'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
#LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_freebob
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)

## LIBFFADO required
## ========================================================
## driver - firewire
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := \
#    firewire/JackFFADODriver.cpp \
#    firewire/JackFFADOMidiInputPort.cpp \
#    firewire/JackFFADOMidiOutputPort.cpp \
#    firewire/JackFFADOMidiReceiveQueue.cpp \
#    firewire/JackFFADOMidiSendQueue.cpp
##'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
#LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_firewire
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)

# ========================================================
# driver - net
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := ../common/JackNetDriver.cpp
#'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_net
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# ========================================================
# driver - loopback
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := ../common/JackLoopbackDriver.cpp
#'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_loopback
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

##HAVE_SAMPLERATE, HAVE_CELT required
## ========================================================
## driver - netone
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := \
#    ../common/JackNetOneDriver.cpp \
#    ../common/netjack.c \
#    ../common/netjack_packet.c
##'HAVE_CONFIG_H','SERVER_SIDE', 'HAVE_PPOLL', 'HAVE_TIMERFD
#LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
#LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include
#LOCAL_SHARED_LIBRARIES := libc libdl libcutils libsamplerate libjackserver
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_netone
#LOCAL_STRIP_MODULE := false
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)

#endif

