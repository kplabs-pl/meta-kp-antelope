LICENSE = "CLOSED"

inherit antelope-image

IMAGE_INSTALL:append = " \
    screen \
"

IMAGE_FSTYPES = "cpio.gz.u-boot cpio.lzma"
