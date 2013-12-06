
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#ifeq ($(findstring -DSEC_JACKAUDIO, $(AUDIO_CFLAGS)), -DSEC_JACKAUDIO)

common_c_includes := \
    $(JACK_ROOT) \
    $(JACK_ROOT)/common \
    $(JACK_ROOT)/common/jack \
    $(JACK_ROOT)/linux \
    $(JACK_ROOT)/posix

common_cflags := -O0 -g -Wall -fexceptions
common_cflags += -Wno-unused -Wno-sign-compare -Wno-deprecated-declarations

# ========================================================
# jack_freewheel
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := freewheel.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_freewheel
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_connect
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := connect.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_connect
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_disconnect
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := connect.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_disconnect
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_lsp
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lsp.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_lsp
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_metro
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := metro.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_metro
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_midiseq
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := midiseq.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_midiseq
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_midisine
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := midisine.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_midisine
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_showtime
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := showtime.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_showtime
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_simple_client
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_client.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_client
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_zombie
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := zombie.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_zombie
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_load
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := ipload.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_load
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_unload
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := ipunload.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_unload
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_alias
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := alias.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_alias
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_bufsize
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := bufsize.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_bufsize
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_wait
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := wait.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_wait
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_samplerate
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := samplerate.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_samplerate
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_evmon
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := evmon.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_evmon
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_monitor_client
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := monitor_client.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_monitor_client
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_thru
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := thru_client.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_thru
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_cpu_load
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := cpu_load.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_cpu_load
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_simple_session_client
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_session_client.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_session_client
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_session_notify
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := session_notify.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_session_notify
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_server_control
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := server_control.cpp
LOCAL_CFLAGS := $(common_cflags)
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_server_control
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

## ========================================================
## jack_net_slave
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := netslave.c
#LOCAL_CFLAGS := $(common_cflags)
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := libjacknet
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_net_slave
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_EXECUTABLE)

## ========================================================
## jack_net_master
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := netmaster.c
#LOCAL_CFLAGS := $(common_cflags)
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := libjacknet
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_net_master
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_EXECUTABLE)

# ========================================================
# jack_latent_client
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := latent_client.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_latent_client
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_midi_dump
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := midi_dump.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_midi_dump
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_midi_latency_test
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := midi_latency_test.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_midi_latency_test
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_transport
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := transport.c
LOCAL_CFLAGS := $(common_cflags) -DNO_READLINE_LIBRARY
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_transport
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

## ========================================================
## jack_rec
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := capture_client.c
#LOCAL_CFLAGS := $(common_cflags)
#LOCAL_C_INCLUDES := $(common_c_includes)  $(JACK_ROOT)/../libsndfile/src
#LOCAL_SHARED_LIBRARIES := libjack libsndfile
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_rec
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_EXECUTABLE)

## ========================================================
## jack_netsource
## ========================================================
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := netsource.c  ../common/netjack_packet.c
#LOCAL_CFLAGS := $(common_cflags) -DNO_JACK_ERROR
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include
#LOCAL_SHARED_LIBRARIES := libsamplerate libjack
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := jack_netsource
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_EXECUTABLE)

## ========================================================
## alsa_in
## ========================================================
#ifeq ($(SUPPORT_ALSA_IN_JACK),true)
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := alsa_in.c  ../common/memops.c
#LOCAL_CFLAGS := $(common_cflags) -DNO_JACK_ERROR -D_POSIX_SOURCE
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include $(ALSA_INCLUDES)
#LOCAL_SHARED_LIBRARIES := libasound libsamplerate libjack
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := alsa_in
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_EXECUTABLE)
#endif

## ========================================================
## alsa_out
## ========================================================
#ifeq ($(SUPPORT_ALSA_IN_JACK),true)
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := alsa_out.c  ../common/memops.c
#LOCAL_CFLAGS := $(common_cflags) -DNO_JACK_ERROR -D_POSIX_SOURCE
#LOCAL_C_INCLUDES := $(common_c_includes) $(JACK_ROOT)/../libsamplerate/include $(ALSA_INCLUDES)
#LOCAL_SHARED_LIBRARIES := libasound libsamplerate libjack
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#LOCAL_MODULE_TAGS := eng optional
#LOCAL_MODULE := alsa_out
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_EXECUTABLE)
#endif

# ========================================================
# inprocess
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := inprocess.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjackserver
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := example_lib
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# ========================================================
# jack_simple_looper
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_looper.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_looper
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_simple_keyboard
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_keyboard.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_keyboard
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_simple_effect
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_effect.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_effect
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_simple_echo
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_echo.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_echo
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_simple_distortion
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := simple_distortion.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_simple_distortion
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

#endif

