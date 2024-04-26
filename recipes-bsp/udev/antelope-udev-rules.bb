LICENSE = "CLOSED"

inherit udev-rules

SRC_URI = " \
    file://50-antelope-mtd-names.rules \
    file://50-ubi.rules \
    file://antelope-ubi-mtd-name \
"

do_install:append() {
    install -m 0755 ${WORKDIR}/antelope-ubi-mtd-name ${D}${sysconfdir}/udev/rules.d/antelope-ubi-mtd-name
}
