PRODUCT_COPY_FILES := \
    device/motorola/scorpion_mini/apns-conf.xml:system/etc/apns-conf.xml

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from scorpion_mini device
$(call inherit-product, device/motorola/scorpion_mini/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_scorpion_mini
PRODUCT_DEVICE := scorpion_mini
PRODUCT_BRAND := Verizon
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := XT907
