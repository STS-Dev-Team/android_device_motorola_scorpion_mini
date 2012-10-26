PRODUCT_MAKEFILES := $(LOCAL_DIR)/full_scorpion_mini.mk
ifeq ($(TARGET_PRODUCT),aokp_scorpion_mini)
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/aokp.mk
endif
ifeq ($(TARGET_PRODUCT),cna_scorpion_mini)
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/cna.mk
endif
