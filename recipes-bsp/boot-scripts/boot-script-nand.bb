LICENSE = "CLOSED"

inherit u-boot-script

SRC_URI = "file://boot-nand.cmd"

SCRIPTS_PATH = "${WORKDIR}"

do_install() {
    install -d -m 0755 ${D}/boot
    install -m 0644 ${B}/boot-nand.scr ${D}/boot/boot.scr
}

FILES:${PN} = "/boot/boot.scr"