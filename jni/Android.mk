# Copyright (C) 2011 The Android-x86 Open Source Project



# HAL module implemenation, not prelinked and stored in
# hw/<OVERLAY_HARDWARE_MODULE_ID>.<ro.product.board>.so

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := liblog
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/liblog.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := libcutils
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libcutils.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_CFLAGS += -DHAVE_SYS_UIO_H -std=c99
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_MODULE := gps.default
LOCAL_MODULE_FILENAME := gps.default
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_SRC_FILES := misc.c interface.c state.c minmea.c gps_status.c reader.c notifier.c device.c gps.c

include $(BUILD_SHARED_LIBRARY)
