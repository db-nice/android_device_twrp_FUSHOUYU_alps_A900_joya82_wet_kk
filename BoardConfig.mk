DEVICE_PATH := device/FUSHOUYU/A900

ALLOW_MISSING_DEPENDENCIES := true

TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := mt6582
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON :=true
ARCH_ARM_HAVE_VFP := true

TARGET_BOOTLOADER_BOARD_NAME := A900
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := A900
TARGET_SCREEN_DENSITY := 210
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE :=
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_HAS_FLIPPED_SCREEN:= true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/recovery.fstab

TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

BOARD_CUSTOM_MKBOOTIMG := $(HOST_OUT_EXECUTABLES)/mtkbootimg$(HOST_EXECUTABLE_SUFFIX)
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --mtk 1

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_THEME := portrait_hdpi
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_USE_TOOLBOX := true
TARGET_RECOVERY_PIXEL_FORMAT := "BRGA_8888"
DEVICE_RESOLUTION := 800x1280
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery/capacity
