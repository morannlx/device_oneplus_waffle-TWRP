#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common
-include $(COMMON_PATH)/BoardConfigCommon.mk

# TWRP specific build flags
TW_FRAMERATE := 120

# Fix Touchscreen issue
TW_NO_SCREEN_BLANK := true

# Vibrator
# TW_USE_QCOM_HAPTICS_VIBRATOR := true
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

TARGET_RECOVERY_DEVICE_MODULES += libexpat android.hardware.vibrator-V2-ndk
RECOVERY_LIBRARY_SOURCE_FILES += \
     $(TARGET_OUT_SHARED_LIBRARIES)/libexpat.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V2-ndk.so

# Building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

