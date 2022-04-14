#
# Copyright (C) 2021 Team Win Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Release name
PRODUCT_RELEASE_NAME := RMX2020
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Extra VNDK Versions
PRODUCT_EXTRA_VNDK_VERSIONS := 29

LOCAL_PATH := device/realme/RMX2020

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := RMX2020
PRODUCT_NAME := twrp_RMX2020
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme Monet
PRODUCT_MANUFACTURER := realme
TW_DEVICE_VERSION := By sarthakroy2002 (For RealmeUI 1.0)

# HACK: Set vendor patch level
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0 \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery
