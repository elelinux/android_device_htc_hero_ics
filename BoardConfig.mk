# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

-include vendor/htc/hero/BoardConfigVendor.mk

# Camera
BUILD_OLD_LIBCAMERA                              := true
LOCAL_CFLAGS:=-fno-short-enums

# Platform
TARGET_BOARD_PLATFORM                            := msm7k
TARGET_BOARD_PLATFORM_GPU                        := qcom

COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

# Bootloader
TARGET_NO_BOOTLOADER                             := true
TARGET_NO_RADIOIMAGE                             := true
TARGET_BOOTLOADER_BOARD_NAME                     := hero
TARGET_OTA_ASSERT_DEVICE                         := hero
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=hero

# Kernel header's
TARGET_SPECIFIC_HEADER_PATH                      := device/htc/hero/include

# ARMv6-compatible processor rev 5 (v6l)
TARGET_CPU_ABI                                   := armeabi-v6j
TARGET_CPU_ABI2                                  := armeabi
TARGET_ARCH_VARIANT                              := armv6j

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER                      := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB                 := libWifiApi
BOARD_WLAN_TI_STA_DK_ROOT                        := system/wlan/ti/sta_dk_4_0_4_32
WIFI_DRIVER_MODULE_PATH                          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG                           := ""
WIFI_DRIVER_MODULE_NAME                          := "wlan"
WIFI_FIRMWARE_LOADER                             := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH                          := "/etc/firmware/tiinit_5.3.53.bts"
WIFI_DRIVER_FW_AP_PATH                           := "/etc/wifi/Fw1251r1c.bin"

# Prebuilt kernel
TARGET_PREBUILT_KERNEL                           := device/htc/hero/kernel
BOARD_KERNEL_CMDLINE                             := no_console_suspend=1 console=null
BOARD_KERNEL_BASE                                := 0x19200000

# Audio
BOARD_USES_GENERIC_AUDIO                         := false

# Bluetooth
BOARD_HAVE_BLUETOOTH                             := true

# Graphics
BOARD_VENDOR_USE_AKMD                            := akm8973
TARGET_HARDWARE_3D                               := false

# QCOM
#BOARD_USES_QCOM_HARDWARE                         := true

# Display
#TARGET_GRALLOC_USES_ASHMEM                       := true
#TARGET_FORCE_CPU_UPLOAD                          := true
USE_OPENGL_RENDERER                              := true
#TARGET_HAVE_BYPASS                               := true
#TARGET_USES_SF_BYPASS                            := false

# OpenGL drivers config file path
BOARD_EGL_CFG                                    := device/htc/hero/prebuilt/egl.cfg

# Sensors
BOARD_USE_HTC_LIBSENSORS                         := true
BOARD_USE_HERO_LIBSENSORS                        := true

# GPS
BOARD_USES_GPSSHIM                               := true
BOARD_GPS_NEEDS_XTRA                             := true
BOARD_VENDOR_QCOM_AMSS_VERSION                   := 20000

# Misc
BOARD_NO_RGBX_8888                               := true
WITH_DEXPREOPT                                   := false

# HTC Release tools
TARGET_RELEASETOOLS_EXTENSIONS                   := device/htc/common

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00040000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 05a00000 00020000 "system"
# mtd4: 05000000 00020000 "cache"
# mtd5: 127c0000 00020000 "userdata"

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE                   := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE               := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE                 := 182917099  # 0x0aa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE               := 0x0a5c0000

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# ICS 
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS
BOARD_USE_LEGACY_TRACKPAD                        := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER            := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file
