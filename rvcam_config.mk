## Basic config settings
## One can use function like this to change the values
## $(call soong_config_set,rvcam,soc,rk3568)
## $(call soong_config_set,rvcam,board,evb_v22)
SOONG_CONFIG_NAMESPACES += rvcam
SOONG_CONFIG_rvcam += \
	soc \
	board

SOONG_CONFIG_rvcam_soc := rk3588
SOONG_CONFIG_rvcam_board := evb_v21

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
	hardware/rockchip/rvcam/hal/fcm/rvcam_compatibility_matrix.xml
