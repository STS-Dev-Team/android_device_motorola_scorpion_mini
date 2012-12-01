DEVICE_FOLDER := device/motorola/scorpion_mini

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/scorpion_mini/scorpion_mini-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay/aosp

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_FOLDER)/include

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# IDC
PRODUCT_COPY_FILES += $(DEVICE_FOLDER)/idc/atmxt-i2c.idc:system/usr/idc/atmxt-i2c.idc

# Audio configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/config/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

#media
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/config/audio_policy.conf:system/etc/audio_policy.conf \
	$(DEVICE_FOLDER)/config/media_profiles.xml:system/etc/media_profiles.xml \
	$(DEVICE_FOLDER)/config/media_codecs.xml:system/etc/media_codecs.xml

#config
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/config/vold.fstab:system/etc/vold.fstab \
	$(DEVICE_FOLDER)/config/gps.conf:system/etc/gps.conf

# init*rc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/rootdir/init.rc:root/init.rc \
    $(DEVICE_FOLDER)/rootdir/ueventd.rc:root/ueventd.rc

# SafeStrap files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/rootdir/init.rc:system/etc/rootfs/init.rc \
    $(DEVICE_FOLDER)/rootdir/init.qcom.rc:system/etc/rootfs/init.qcom.rc \
    $(DEVICE_FOLDER)/rootdir/init.target.rc:system/etc/rootfs/init.target.rc \
    $(DEVICE_FOLDER)/rootdir/ueventd.rc:system/etc/rootfs/ueventd.rc \
    $(DEVICE_FOLDER)/safestrap/adbd:system/etc/rootfs/sbin/adbd \
    $(DEVICE_FOLDER)/safestrap/default.prop:system/etc/rootfs/default.prop \
    $(DEVICE_FOLDER)/safestrap/init:system/etc/rootfs/init

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
	telephony.lteOnCdmaDevice=1 \
	ro.telephony.default_network=10 \
	ro.modem.no_wdog_chk=1 \
    ro.cdma.subscribe_on_ruim_ready=true \
	ro.cdma.home.operator.numeric=310004 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	persist.radio.mode_pref_nv10=1 \
	persist.radio.vrte_logic=2 \
	persist.radio.0x9e_not_callname=1 \
	persist.radio.skip_data_check=1 \
	persist.ril.max.crit.qmi.fails=4 \
	ro.cdma.data_retry_config=max_retries=infinite,0,0,10000,10000,100000,10000,10000,10000,10000,140000,540000,960000 \
	ro.gsm.data_retry_config=default_randomization=2000,max_retries=infinite,1000,1000,80000,125000,485000,905000 \
	ro.gsm.2nd_data_retry_config=max_retries=1,15000 \
	ro.mot.eri=1 \
	ro.cdma.nbpcd=1 \
	ro.cdma.home.operator.isnan=1 \
	ro.mot.ignore_csim_appid=true \
	ro.telephony.gsm-routes-us-smsc=1 \
	ro.cdma.otaspnumschema=SELC,1,80,99 \
	ro.mot.phonemode.vzw4gphone=1 \
	ro.com.android.dataroaming=true \
    persist.radio.no_wait_for_card=1

#usb
PRODUCT_PROPERTY_OVERRIDES += \
	ro.usb.mtp=0x2e50 \
	ro.usb.mtp_adb=0x2e51 \
	ro.usb.ptp=0x2e52 \
	ro.usb.ptp_adb=0x2e53

#graphics
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	debug.sf.no_hw_vsync=1

#misc
PRODUCT_PROPERTY_OVERRIDES += \
	debug.enable.wl_log=1 \
	persist.fuse_sdcard=true \
	ro.warmboot.capability=1 \
	ro.com.google.clientid=android-motorola \
	ro.com.google.gmsversion=4.1_r2 \
	ro.setupwizard.mode=ENABLED \
	ro.com.google.clientidbase=android-motorola \
	ro.com.google.clientidbase.ms=android-verizon \
	ro.com.google.clientidbase.am=android-verizon \
	ro.com.google.clientidbase.gmm=android-motorola \
	ro.com.google.clientidbase.yt=android-verizon \
	persist.sys.qc.sub.rstrtlvl=3 \
	persist.sys.qc.sub.rdump.max=20 \
	ro.media.enc.aud.fileformat=qcp \
	ro.media.enc.aud.codec=qcelp \
	ro.media.enc.aud.bps=13300

# symlinks
PRODUCT_PACKAGES += \
    wiperiface \
    WCNSS_qcom_wlan_nv.bin

# wifi
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/wififirmware/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(DEVICE_FOLDER)/wififirmware/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(DEVICE_FOLDER)/wififirmware/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(DEVICE_FOLDER)/wififirmware/WCNSS_qcom_wlan_nv_regulatory.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_regulatory.bin

# copy all kernel modules under the "modules" directory to system/lib/modules
#PRODUCT_COPY_FILES += $(shell \
#    find device/motorola/scorpion_mini/kernel/modules -name '*.ko' \
#    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
#    | tr '\n' ' ')

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#LOCAL_KERNEL := device/motorola/scorpion_mini/kernel/zImage
#else
#LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

# Inherit from msm8960-common
$(call inherit-product, device/motorola/msm8960-common/msm8960-common.mk)
# Inherit cdma specific stuff
$(call inherit-product-if-exists, vendor/motorola/msm8960-common/msm8960-common-vendor.mk)
