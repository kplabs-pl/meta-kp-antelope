echo "Antelope: Select boot image with GPIO pins"

setenv boot_image 0

if gpio input 29; then
else
    setexpr boot_image ${boot_image} + 1
fi

if gpio input 30; then
else
    setexpr boot_image ${boot_image} + 2
fi

if gpio input 31; then
else
    setexpr boot_image ${boot_image} + 4
fi

echo "Antelope: Selected BOOT image ${boot_image}"

setenv boot_tftp "dhcp ${pxefile_addr_r} /antelope-boot.scr && source ${pxefile_addr_r}"

setenv boot_safe_image "sf read ${ramdisk_addr_r} 0x500000 0x3B00000 && bootm ${ramdisk_addr_r}"

setenv nand_0_offset 0x0
setenv nand_0_size 0x20000000

setenv nand_1_offset 0x20000000
setenv nand_1_size 0x20000000

setenv nand_2_offset 0x40000000
setenv nand_2_size 0x20000000

setenv nand_3_offset 0x60000000
setenv nand_3_size 0x20000000

setenv nand_4_offset 0x80000000
setenv nand_4_size 0x20000000

setenv nand_5_offset 0xA0000000
setenv nand_5_size 0x20000000

setenv boot_nand_configure_mtd "echo Configuring MTD partions && setenv mtdids nand0=nand0 && printenv mtdparts && mtdparts"
setenv boot_nand_mount_ubi "echo Mounting UBI volume && ubi part rootfs && ubifsmount ubi0:rootfs"
# Reuse pxefile_addr_r as PXE boot will not be used at this point
setenv boot_nand_execute_script "echo Loading image-specific boot script && ubifsload ${pxefile_addr_r} /boot/boot.scr && echo Executing image-specific boot script && source ${pxefile_addr_r}"

setenv boot_nand "run boot_nand_configure_mtd && run boot_nand_mount_ubi && run boot_nand_execute_script"

setenv nand0 "echo Booting from NAND half0 && setenv mtdparts nand0:${nand_0_size}@${nand_0_offset}(rootfs) && setenv nand_parition_name linux-0 && run boot_nand"
setenv nand1 "echo Booting from NAND half1 && setenv mtdparts nand0:${nand_1_size}@${nand_1_offset}(rootfs) && setenv nand_parition_name linux-1 && run boot_nand"
setenv nand2 "echo Booting from NAND half1 && setenv mtdparts nand0:${nand_2_size}@${nand_2_offset}(rootfs) && setenv nand_parition_name linux-2 && run boot_nand"
setenv nand3 "echo Booting from NAND half1 && setenv mtdparts nand0:${nand_3_size}@${nand_3_offset}(rootfs) && setenv nand_parition_name linux-3 && run boot_nand"
setenv nand4 "echo Booting from NAND half1 && setenv mtdparts nand0:${nand_4_size}@${nand_4_offset}(rootfs) && setenv nand_parition_name linux-4 && run boot_nand"
setenv nand5 "echo Booting from NAND half1 && setenv mtdparts nand0:${nand_5_size}@${nand_5_offset}(rootfs) && setenv nand_parition_name linux-5 && run boot_nand"

setenv boot_image_0 'run boot_safe_image'
setenv boot_image_1 'run nand0'
setenv boot_image_2 'run nand1'
setenv boot_image_3 'run nand2'
setenv boot_image_4 'run nand3'
setenv boot_image_5 'run nand4'
setenv boot_image_6 'run nand5'
setenv boot_image_7 'run boot_tftp'

run boot_image_${boot_image}