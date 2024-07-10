inherit deploy nopackages

LICENSE = "CLOSED"

SRC_URI = "file://spi-flash-layout.txt"

do_deploy() {
    install -d -m 0755 ${DEPLOYDIR}/
    install -m 0644 ${WORKDIR}/spi-flash-layout.txt ${DEPLOYDIR}/spi-flash-layout.txt
}

addtask do_deploy before do_build after do_compile
