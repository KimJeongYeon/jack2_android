
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#ifeq ($(findstring -DSEC_JACKAUDIO, $(AUDIO_CFLAGS)), -DSEC_JACKAUDIO)

common_shm_libsource := \
    BnAndroidShm.cpp \
    BpAndroidShm.cpp \
    IAndroidShm.cpp \
    AndroidShm.cpp \
    Shm.cpp

common_c_includes := \
    $(JACK_ROOT) \
    $(JACK_ROOT)/common \
    $(JACK_ROOT)/android \
    $(JACK_ROOT)/common/jack \
    $(JACK_ROOT)/linux \
    $(JACK_ROOT)/posix \
    $(JACK_STL_INCLUDES)

common_shm_cflags := -O0 -g -Wall -fexceptions -DHAVE_CONFIG_H
common_shm_cflags += -Wno-unused

# ========================================================
# libjackshm.so
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_shm_libsource)
LOCAL_CFLAGS := $(common_shm_cflags) -DSERVER_SIDE 
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libbinder
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := libjackshm
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# ========================================================
# driver - goldfish (for emulator)
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := JackGoldfishDriver.cpp
LOCAL_CFLAGS := $(common_cflags) -DSERVER_SIDE
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libjackserver
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/jack
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_goldfish
LOCAL_STRIP_MODULE := false
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

#endif

