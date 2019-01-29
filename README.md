# qemu-rpi-kernel
Qemu kernel for emulating Rpi on QEMU

While I was searching the internet about emulating QEMU, most of the guides pointed to link https://xecdesign.com/downloads/linux-qemu/kernel-qemu which is dead as of now.
So making it available on github for someone who would like to use it.
Hope it helps.

This repo contains two types of kernels.

kernel-qemu-3.10.25-wheezy, which is the original kernel from link https://xecdesign.com/downloads/linux-qemu/kernel-qemu - Works fine with any wheezy image with changes mentioned in wiki.

kernel-qemu-4.x.xx-jessie, are newer kernels compiled compatible with jessie as well as they work well with older wheezy images. 

kernel-qemu-4.9.xx-stretch, are new kernels compiled compatible with stretch, recommended to use same version of rpi image and kernel:
image - http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-12-01/
kernel - https://github.com/raspberrypi/linux/releases/tag/raspberrypi-kernel_1.20171029-1

You need dtb file for qemu to work with newer kernels:
qemu-system-arm -kernel kernel-qemu-4.9.59-stretch -cpu arm1176 -m 256 -M versatilepb -dtb versatile-pb.dtb -no-reboot -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -net nic -net user,hostfwd=tcp::5022-:22 -hda 2017-11-29-raspbian-stretch-lite.img


Build scripts are kept in tools folder for reference.

Go through wiki page (https://github.com/dhruvvyas90/qemu-rpi-kernel/wiki) for step by step guide how to emulate Raspberry Pi on Qemu on any platform (Win, linux or Mac OS)
