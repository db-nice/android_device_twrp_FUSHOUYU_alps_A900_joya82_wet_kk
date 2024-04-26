## Specify phone tech before including full_phone
#$(call inherit-product, vendor/omni/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := OmniRom_Twrp_3.1.0

# $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
 $(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
 $(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# $(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/FUSHOUYU/A900/device.mk)

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := A900
PRODUCT_NAME := omni_A900
PRODUCT_BRAND := FUSHOUYU
PRODUCT_MODEL := KOT49H_K1001_SP
TARGET_VENDOR := joya82_wet_kk_alps
# Release name
PRODUCT_RELEASE_NAME := joya82_wet_kk

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="joya82_wet_kk-user 4.4.2 KOT49H eng.root.1544865096 test-keys"

BUILD_FINGERPRINT := alps/joya82_wet_kk/joya82_wet_kk:4.4.2/KOT49H/1544865096:user/test-keys


