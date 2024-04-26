inherit core-image

IMAGE_FEATURES = "debug-tweaks"

IMAGE_INSTALL:append = " \
    antelope-udev-rules \
    openssh \
    mtd-utils \
    mtd-utils-ubifs \
"
