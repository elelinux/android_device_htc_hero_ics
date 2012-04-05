$(call inherit-product, device/htc/hero/full_hero.mk)
PRODUCT_RELEASE_NAME := hero

# Set bootanimation resolution
#TARGET_BOOTANIMATION_NAME := vertical-240x320

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=IML74K BUILD_FINGERPRINT=google/soju/crespo:4.0.3/IML74K/239410:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.3 IML74K 239410 release-keys" BUILD_NUMBER=239410

PRODUCT_NAME := cm_hero
PRODUCT_DEVICE := hero
