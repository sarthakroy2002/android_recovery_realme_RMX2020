# Copyright (C) 2024The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Prebuit files for recovery ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery,$(TARGET_COPY_OUT_RECOVERY)/root)

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-mock

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
