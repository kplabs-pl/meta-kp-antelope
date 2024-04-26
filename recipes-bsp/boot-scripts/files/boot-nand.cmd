echo "Booting from NAND"

echo "Loading boot files"
ubifsload ${kernel_addr_r} /boot/Image
ubifsload ${fdt_addr_r} /boot/devicetree/system-top.dtb

echo "Booting"
setenv bootargs "$bootargs ubi.mtd=$nand_parition_name root=ubi0:rootfs rootfstype=ubifs"
booti ${kernel_addr_r} - ${fdt_addr_r}
