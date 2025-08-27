#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from OEM SOC-common
$(call inherit-product, $(COMMON_PATH)/device-common.mk)

TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp

