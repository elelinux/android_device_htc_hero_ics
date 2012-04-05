#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlay's
DEVICE_PACKAGE_OVERLAYS := device/htc/hero/overlay

# Hero uses high-density artwork where available
PRODUCT_LOCALES += mdpi

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
    
PRODUCT_COPY_FILES += \
    device/htc/hero/prebuilt/vold.fstab:system/etc/vold.fstab

# Don't set /proc/sys/vm/dirty_ratio to 0 when USB mounting
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# proprietary side of the device
$(call inherit-product-if-exists, vendor/htc/hero/device_hero-vendor.mk)

# No zram in kernel, so use ramzswap for compcache 
PRODUCT_COPY_FILES += \
    device/htc/hero/prebuilt/12compcache:system/etc/init.d/12compcache \
    device/htc/hero/prebuilt/rzscontrol:system/xbin/rzscontrol 

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.hero \
    audio_policy.hero 

# Hero sensors etc...
PRODUCT_PACKAGES += \
    sensors.hero \
    lights.hero \
    gps.hero \
    camera.hero

# Libs
PRODUCT_PACKAGES += \
    librs_jni \
    wlan_loader \
    tiwlan.ini \
    dhcpcd.conf \
    VoiceDialer \
    com.android.future.usb.accessory

# QCOM Display
PRODUCT_PACKAGES += \
    gralloc.hero \
#    copybit.hero 
#    hwcomposer.msm7k \

# OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    libmm-omxcore 

# USB mass storage
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

PRODUCT_COPY_FILES += \
    device/htc/hero/prebuilt/init.rc:root/init.rc \
    device/htc/hero/prebuilt/init.hero.rc:root/init.hero.rc \
    device/htc/hero/prebuilt/init.hero.usb.rc:root/init.hero.usb.rc \
    device/htc/hero/prebuilt/ueventd.hero.rc:root/ueventd.hero.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/hero/keylayout/hero-keypad.kl:system/usr/keylayout/hero-keypad.kl \
    device/htc/hero/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/hero/keychars/hero-keypad.kcm:system/usr/keychars/hero-keypad.kcm 

# idc
PRODUCT_COPY_FILES += \
    device/htc/hero/idc/hero-nav.idc:system/usr/idc/hero-nav.idc \
    device/htc/hero/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/hero/prebuilt/apns-conf.xml:/system/etc/apns-conf.xml \
    device/htc/hero/prebuilt/media_profiles.xml:/system/etc/media_profiles.xml 

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/hero/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Install Hero kernel modules
$(call inherit-product, device/htc/hero/hero-modules.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)
