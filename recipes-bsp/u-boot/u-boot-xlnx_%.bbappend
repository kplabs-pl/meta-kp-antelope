FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://nand-single-chip.cfg \
    file://tftp-buffers.cfg \
    file://ethernet-phy.cfg \
    file://qspi-boot-script-offset.cfg \
    file://wget.cfg \
"

SRC_URI += " \
    file://0001-Arasan-NAND-Disable-sub-page-writes.patch \
"
