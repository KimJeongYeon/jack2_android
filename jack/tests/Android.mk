
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#ifeq ($(findstring -DSEC_JACKAUDIO, $(AUDIO_CFLAGS)), -DSEC_JACKAUDIO)

common_c_includes := \
    $(JACK_ROOT)/common \
    $(JACK_ROOT)/common/jack \
    $(JACK_ROOT)/linux \
    $(JACK_ROOT)/posix 

common_cflags := -O0 -g -Wall -fexceptions
common_cflags += -Wno-unused -Wno-deprecated-declarations

# ========================================================
# jack_test
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := test.cpp
LOCAL_CFLAGS := $(common_cflags)
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack libjackshm
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_test
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_cpu
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := cpu.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack libjackshm
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_cpu
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_iodelay
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := iodelay.cpp
LOCAL_CFLAGS := $(common_cflags)
LOCAL_CFLAGS += -Wno-narrowing
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack libjackshm
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_iodelay
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# jack_multiple_metro
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := external_metro.cpp
LOCAL_CFLAGS := $(common_cflags)
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := libjack libjackshm
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := jack_multiple_metro
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

#endif

