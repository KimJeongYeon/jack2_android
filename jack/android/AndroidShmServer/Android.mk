LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	main_androidshmservice.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	libbinder \
	libjackshm

LOCAL_C_INCLUDES := \
    $(JACK_ROOT) \
    $(JACK_ROOT)/common \
	$(JACK_ROOT)/common/jack \
	$(JACK_ROOT)/linux \
	$(JACK_ROOT)/posix

common_cflags := -O0 -g -Wall -fexceptions -fvisibility=hidden -frtti -DHAVE_CONFIG_H
common_cflags += -Wno-unused

# ========================================================
# androidshmservice
# ========================================================
LOCAL_CFLAGS := $(common_cflags)
LOCAL_LDFLAGS := $(JACK_STL_LDFLAGS)
LOCAL_MODULE_TAGS := eng optional
LOCAL_MODULE:= androidshmservice

include $(BUILD_EXECUTABLE)

