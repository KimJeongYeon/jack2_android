#
# jack-1.9.9.5
#

ifeq (true,$(call spf_check,SEC_PRODUCT_FEATURE_AUDIO_JAM,TRUE))

JACK_ROOT := $(call my-dir)

ifeq (,$(filter full full_x86 sdk sdk_x86,$(TARGET_PRODUCT))) # to check the target is x86
SUPPORT_ALSA_IN_JACK := true
JACK_STL_LDFLAGS  := -Lprebuilts/ndk/8/sources/cxx-stl/gnu-libstdc++/libs/armeabi-v7a -lgnustl_static
else
SUPPORT_ALSA_IN_JACK := false
JACK_STL_LDFLAGS := -Lprebuilts/ndk/8/sources/cxx-stl/gnu-libstdc++/libs/x86 -lgnustl_static
endif
JACK_STL_INCLUDES := prebuilts/ndk/8/sources/cxx-stl/gnu-libstdc++/include \
                     prebuilts/ndk/8/sources/cxx-stl/gnu-libstdc++/libs/armeabi-v7a/include

ALSA_INCLUDES := vendor/samsung/common/external/alsa-lib/include

include $(JACK_ROOT)/common/Android.mk
include $(JACK_ROOT)/linux/Android.mk
include $(JACK_ROOT)/example-clients/Android.mk
include $(JACK_ROOT)/tests/Android.mk
include $(JACK_ROOT)/android/Android.mk
include $(JACK_ROOT)/android/AndroidShmServer/Android.mk
include $(JACK_ROOT)/android/AndroidShmServer/test/Android.mk

endif
