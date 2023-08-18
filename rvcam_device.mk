# Rockchip Vehicle Camera Packages
ifeq ($(strip $(BOARD_CAMERA_SUPPORT_AUTOMOTIVE)), true)
# EVS packages
LOCAL_EVS_PROPERTIES ?= persist.automotive.evs.mode=1
PRODUCT_PRODUCT_PROPERTIES += $(LOCAL_EVS_PROPERTIES)
PRODUCT_PACKAGES += \
    evs_app \
    android.hardware.automotive.evs@1.1-rvcam \
    android.frameworks.automotive.display@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hal/evs/app/evs_app_config.json:$(TARGET_COPY_OUT_SYSTEM)/etc/automotive/evs/config_override.json \
    $(LOCAL_PATH)/hal/evs/app/evs_configuration_override.xml:$(TARGET_COPY_OUT_VENDOR)/etc/automotive/evs/evs_configuration/evs_configuration_override.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rvcam.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.rvcam.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/components/config/xml/rvcam_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rvcam_config.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hal/provider/2.4/automotive_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/automotive_camera_config.xml

include packages/services/Car/cpp/evs/apps/sepolicy/evsapp.mk
include hardware/rockchip/rvcam/hal/evs/1.1/sepolicy/evsdriver.mk

PRODUCT_PACKAGES += \
    vendor.rockchip.automotive.camera.rvcam@1.0 \
    vendor.rockchip.automotive.camera.rvcam@1.0-service \
    librvcam_client@1.0

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-automotive \
    android.hardware.camera.provider@2.4-automotive-service

PRODUCT_PRODUCT_PROPERTIES += persist.vendor.rockchip.rvcam.loglevel=1

include hardware/rockchip/rvcam/hal/hidl/rvcam/server/sepolicy.mk

endif
