FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://qspi-partitions.dtsi \
    file://nand.dtsi \
"

EXTRA_OVERLAYS += " \
    qspi-partitions.dtsi \
    nand.dtsi \
"
YAML_ENABLE_DT_OVERLAY = "1"
