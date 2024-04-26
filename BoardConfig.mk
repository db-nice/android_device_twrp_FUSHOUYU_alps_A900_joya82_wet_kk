# inherit from the proprietary version
DEVICE_PATH := device/FUSHOUYU/A900

ALLOW_MISSING_DEPENDENCIES := true

TARGET_ARCH := arm
#TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6582
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT_RUNTIME := cortex-a7

#TLS 寄存器，支持 NEON 指令集，支持矢量浮点处理 (VFP)
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON :=true
ARCH_ARM_HAVE_VFP := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := A900
#有fastboot就true没有就false
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := A900
# Display,密度
TARGET_SCREEN_DENSITY := 210

# arguments: [bootimg file]
# bootimg file: boot.img
# output: kernel[.gz] ramdisk[.gz] second[.gz]
# base: 0x10000000
# ramdisk_addr: 0x11000000
# second_addr: 0x10f00000
# tags_addr: 0x10000100
# page_size: 2048
# name: ""
# cmdline: ""
# padding_size=2048
# arguments: [ramdisk file] [directory]
# ramdisk file: ramdisk
# directory: initrd
# output: cpiolist.txt
# Found mtk magic, skip header.
# Found header name RECOVERY
# compress: True
#----------------------------------------------
# kernel = boot.img-kernel
# cmdline =
# board =
# base = 0x10000000
# pagesize = 2048
# kernel_offset = 0x00008000
# ramdisk_offset = 0x01000000
# second_offset = 0x00f00000
# tags_offset = 0x00000100
# header_version = 0
# hashtype = sha1

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE :=
BOARD_FLASH_BLOCK_SIZE := 512 #(BOARD_KERNEL_PAGESIZE * 64)注意,联发科是512,需计算的是高通soc
BOARD_RAMDISK_OFFSET := 0x01000000 # (ramdisk,loadAddr - BOARD_KERNEL_BASE)
BOARD_KERNEL_TAGS_OFFSET := 0x00000100 # (tagsLoadAddr - BOARD_KERNEL_BASE)

#对于颠倒安装的屏幕，将屏幕上下翻转
BOARD_HAS_FLIPPED_SCREEN:= true

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Custom recovery
#设备没有“选择”按钮.没有物理按钮来选择选项或确认操作。需要使用触摸屏或其他输入方法来进行选择
BOARD_HAS_NO_SELECT_BUTTON := true
#设备具有较大的文件系统.这通常意味着设备可以存储大量数据，例如应用程序、音乐、视频和照片
BOARD_HAS_LARGE_FILESYSTEM := true

#虽然fstab里没有,但分区表里是有单独的分区,但全是占位符合,所以当没有
BOARD_HAS_NO_MISC_PARTITION := true

TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# TWRP
RECOVERY_VARIANT := twrp

TWHAVE_SELINUX := true

TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN

#对应图标主题
TW_THEME := portrait_hdpi
#准确地识别设备，使用此参数,在某些设备上，如果cpuinfo没有序列号，TWRP备份文件夹名称将显示0000000000。使用此标志时，ro.product.model 将用作
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

TW_INTERNAL_STORAGE_PATH := "/data/media/0"  #定义内置存储路径
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"  #定义内置存储挂载点
TW_EXTERNAL_STORAGE_PATH := "/external_sd" #定义是否支持外置SD卡，一般是external_sd
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd" #定义外置SD卡挂载点，一般是external_sd

#usb,otg该变量用于指定自定义文件的路径，该文件定义当设备作为 USB 大容量存储设备连接到计算机时 LUN（逻辑单元号）的内容。这允许您自定义存储在 LUN 上的数据，从而可能提供其他功能或存储选项。
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file"
#是否不包含超级用户。如果 twrp 包含超级用户，将在每次启动时提醒用户手机已 root
TW_EXCLUDE_SUPERSU := true
#定义是否使用toybox替换busybox
TW_USE_TOOLBOX := false
TARGET_RECOVERY_PIXEL_FORMAT := "BRGA_8888"

#rec的prop里null.adb读的prop里ro.ty.fake.resolution=2560X1600,四不像,玄学信一波wm size
#Aida64/devcheck/decive info hw软件检测全是1280x800
#ro.ty.flag=K1001_SP_K1001_COM_MODEM_2G-HD-2_KK_V1.1.0_181215_800x1280_PORT
# C:\>adb shell wm size
# Physical size: 800x1280
#设置里关于平板电脑分辨率:2560x1600,自带的安兔兔是2560x1600,但连基础的CPU信息都没读对,6582读成6799,x30

DEVICE_RESOLUTION := 800x1280

DEVICE_SCREEN_WIDTH := 800
DEVICE_SCREEN_HEIGHT := 1280

TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp

#电池电量
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery/capacity

# 此行控制是否在恢复环境中对图形渲染使用行长调整。
# 这对于与某些设备或显示分辨率的兼容性可能是必需的。true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#不禁reboot BOOTLOADER 虽然fastboot有刷入限制,引导上的防盗版机制,禁止写入操作
# TW_NO_REBOOT_BOOTLOADER := true