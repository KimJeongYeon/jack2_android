LOCAL_PATH:=$(call my-dir)

common_cflags := -O0 -g -Wall -fexceptions -DHAVE_CONFIG_H

# ========================================================
# shmservicetest
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := shmservicetest.cpp
LOCAL_SHARED_LIBRARIES := libcutils libutils libjackshm libbinder
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := shmservicetest
LOCAL_CFLAGS += -DLOG_TAG=\"ShmServiceTest\" 
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

# ========================================================
# shmservicedump
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := shmservicedump.cpp
common_c_includes := \
    $(JACK_ROOT) \
    $(JACK_ROOT)/common \
    $(JACK_ROOT)/common/jack \
    $(JACK_ROOT)/linux \
    $(JACK_ROOT)/posix
LOCAL_SHARED_LIBRARIES := libcutils libutils libjackshm libbinder
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE := shmservicedump
LOCAL_CFLAGS += $(common_cflags) -DLOG_TAG=\"ShmServiceDump\"
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_PRELINK_MODULE := false

include $(BUILD_EXECUTABLE)

