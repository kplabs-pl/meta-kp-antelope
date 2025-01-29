LICENSE = "CLOSED"

inherit nopackages

ANTELOPE_ALL_IMAGES ?= "antelope-minimal-image"

DEPENDS = "\
    ${ANTELOPE_ALL_IMAGES} \
    bootbin-firmware \
    boot-script-pins \
    virtual/kernel \
    device-tree \
"
