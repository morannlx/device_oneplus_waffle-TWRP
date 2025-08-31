#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Identifier for common folder
COMMON_SOC := sm86xx

# Define hardware platform
PRODUCT_PLATFORM := pineapple

SHRP_DEVICE_CODE := waffle
SHRP_PATH := device/oneplus/$(SHRP_DEVICE_CODE)
SHRP_MAINTAINER := SnowWolf725
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A/B
SHRP_REC := "/dev/block/bootdevice/by-name/recovery"
SHRP_HAS_RECOVERY_PARTITION := true
SHRP_AB := true
SHRP_EDL_MODE := 1
SHRP_INTERNAL := "/sdcard"
SHRP_EXTERNAL := "/external_sd"
SHRP_OTG := "/usb_otg"
SHRP_FLASH := 1
SHRP_STATUSBAR_RIGHT_PADDING := 58
SHRP_STATUSBAR_LEFT_PADDING := 58
SHRP_NOTCH := true
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true
#SHRP_DARK := false
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := "/sys/class/leds/led:torch_0/brightness"
SHRP_FLASH_MAX_BRIGHTNESS := 500

#SHRP_EXTERNAL_ADDON_PATH := "device/oneplus/$(SHRP_DEVICE_CODE)/Addons/"
#SHRP_EXTERNAL_ADDON_1_NAME := "Limitless Photos"
#SHRP_EXTERNAL_ADDON_1_INFO := "A Magisk/KSU module to unlock unlimited photos storage"
#SHRP_EXTERNAL_ADDON_1_FILENAME := "LimitlessPhotos.zip"
#SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Install"
#SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Installed Limitless Photos"
#SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true


#
#
#
# The below variables will be generated automatically
#
#
# Release name (automatically taken from this file's suffix)
PRODUCT_RELEASE_NAME := $(lastword $(subst /, ,$(lastword $(subst _, ,$(firstword $(subst ., ,$(MAKEFILE_LIST)))))))

# Custom vendor used in build tree (automatically taken from this file's prefix)
CUSTOM_VENDOR := $(lastword $(subst /, ,$(firstword $(subst _, ,$(firstword $(MAKEFILE_LIST))))))

# Inherit from our custom product configuration
$(call inherit-product, vendor/$(CUSTOM_VENDOR)/config/common.mk)

# OEM Info (automatically taken from device tree path)
BOARD_VENDOR := $(or $(word 2,$(subst /, ,$(firstword $(MAKEFILE_LIST)))),$(value 2))

## Device identifier. This must come after all inclusions

PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := $(CUSTOM_VENDOR)_$(PRODUCT_DEVICE)
PRODUCT_MODEL := CPH2573
PRODUCT_SYSTEM_NAME := $(PRODUCT_MODEL)
PRODUCT_SYSTEM_DEVICE := OP595DL1
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

# Assert
TARGET_OTA_ASSERT_DEVICE := $(PRODUCT_RELEASE_NAME)

# Theme
TW_STATUS_ICONS_ALIGN := center
TW_Y_OFFSET := 111
TW_H_OFFSET := -111

# SPR
PRODUCT_PROPERTY_OVERRIDES += vendor.display.enable_spr=1

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

# Common path for device trees
COMMON_PATH := device/$(PRODUCT_BRAND)/$(COMMON_SOC)-common

# Device path for OEM device tree
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, $(DEVICE_PATH)/device-$(PRODUCT_DEVICE).mk)
