# inherit from common
-include device/motorola/msm8960-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/motorola/scorpion_mini/BoardConfigVendor.mk

BOARD_USERDATAIMAGE_PARTITION_SIZE := 4294967296

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/scorpion_mini/bluetooth

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/motorola/msm8960-common

#Twrp
DEVICE_RESOLUTION := 540x960
