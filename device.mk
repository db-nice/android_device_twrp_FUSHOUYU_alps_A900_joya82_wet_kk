$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product-if-exists, device/common/gps/gps_us_supl.mk)

LOCAL_PATH := device/FUSHOUYU/A900

#DEVICE_PACKAGE_OVERLAYS += device/FUSHOUYU/A900/overlay

# $(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := A900
PRODUCT_DEVICE := A900

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=1 \
ro.allow.mock.location=0 \
persist.mtk.aee.aed=on \
ro.debuggable=0 \
ro.adb.secure=1 \
persist.sys.usb.config=mass_storage \
persist.service.acm.enable=0 \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no
