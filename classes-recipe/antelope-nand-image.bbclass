inherit antelope-image

UBI_VOLNAME = "rootfs"
MKUBIFS_ARGS = "--min-io-size=8KiB --leb-size=1008KiB --max-leb-cnt=512"
UBINIZE_ARGS = "--min-io-size=8KiB --peb-size=1024KiB"

IMAGE_FSTYPES = "ubi cpio.gz"

IMAGE_INSTALL:append = " \
    device-tree \
    kernel-image-image \
    boot-script-nand \
"