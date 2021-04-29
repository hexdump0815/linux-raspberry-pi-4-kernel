these files were taken from 45a0022ac64b4d0788def3c5230c972430f6fc23 of https://github.com/raspberrypi/userland.git

host_applications/linux/apps/dtmerge/dtmerge.c
helpers/dtoverlay/dtoverlay.c
helpers/dtoverlay/dtoverlay.h

required: apt-get install libfdt-dev

compile with: cc -I. -o dtmerge dtmerge.c dtoverlay.c -l fdt

dtmerge info: https://www.raspberrypi.org/documentation/configuration/device-tree.md#part3.1

IMPORTANT:
do not specify cma=xyzM on the kernel cmdline as then it will end up in the wrong memory region
see: https://github.com/raspberrypi/linux/issues/3861

default cma size is 256mb - if another size is required, use (example 320mb):

/compile/doc/rpi/misc.64b/misc/dtmerge/dtmerge arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-vc4-kms-v3d.dtb arch/arm64/boot/dts/overlays/vc4-kms-v3d.dtbo cma-size=0x14000000

i think something around 512mb is the max possible and i think cma + gpu_mem in config.txt must stay
below a certain value below 1gb (see: https://www.raspberrypi.org/forums/viewtopic.php?t=285068#p1728536)
