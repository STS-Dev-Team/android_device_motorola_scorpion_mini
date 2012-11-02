# inherit from common
-include device/motorola/msm8960-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/motorola/scorpion_mini/BoardConfigVendor.mk

# Kernel
#TARGET_PREBUILT_KERNEL := device/motorola/scorpion_mini/kernel

#Twrp
DEVICE_RESOLUTION := 540x960
