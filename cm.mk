$(call inherit-product, device/motorola/scorpion_mini/full_scorpion_mini.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/scorpion_mini/overlay/cm

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=scorpion_mini TARGET_DEVICE=scorpion_mini BUILD_FINGERPRINT="motorola/XT907_verizon/scorpion_mini:4.1.1/9.8.1Q_25/35:user/release-keys" PRIVATE_BUILD_DESC="smq_vzw-user 4.1.1 9.8.1Q_25 35 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

PRODUCT_NAME := cm_scorpion_mini
PRODUCT_DEVICE := scorpion_mini

