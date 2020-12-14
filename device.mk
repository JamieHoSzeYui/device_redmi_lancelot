# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/redmi/lancelot/lancelot-vendor.mk)

# Define Dynamic Partition support
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE := true

# Properties
include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# A/B
AB_OTA_UPDATER := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

# Camera
PRODUCT_PACKAGES += \
    Snap

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/recovery.fstab:$(TARGET_COPY_OUT_RAMDISK)/recovery.fstab
    
# NFC stack (AOSP)
PRODUCT_PACKAGES += \
    NfcNci

# ImsInit hac
PRODUCT_PACKAGES += \
    ImsInit
    
# Init
PRODUCT_PACKAGES += \
    recovery.fstab
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Telephony Jars
# PRODUCT_BOOT_JARS += \
#     mediatek-common \
#     mediatek-framework \
#     mediatek-ims-base \
#     mediatek-ims-common \
#     mediatek-telecom-common \
#     mediatek-telephony-base \
#     mediatek-telephony-common
