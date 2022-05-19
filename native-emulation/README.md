## Native emulation of Rpi2/3 using Qemu's Raspi2/3 machine

This section of repo contains a set of instructions and relevant files in order to emulate 
raspberry pi using Qemu's raspi2/raspi3 machine.

### Pre requisites

- Qemu 5.1+
- Raspberry pi img file
- Raspberry pi kernel image
- Relevant dtb files

### Step by step guide to extract dtb files and kernel image from img file

Mount the image file

- `sudo mkdir /mnt/rpi`
- `sudo losetup -f --show -P <path-to-rpi-image-file>`
- `sudo mount /dev/loop<no>p01 /mnt/rpi`

Copy kernel files / dtb files

- `cp /mnt/rpi/kernel* .`
- `cp /mnt/rpi/*.dtb .`

Unmount the image file

- `sudo umount /mnt/rpi`
- `sudo losetup -d /dev/loop<no>`

### Command to emulate

- `sudo qemu-system-aarch64 -M raspi3b -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" -dtb ./dtbs/bcm2710-rpi-3-b-plus.dtb -sd 2020-08-20-raspios-buster-armhf-full.img -kernel kernel8.img -m 1G -smp 4 -serial stdio -usb -device usb-mouse -device usb-kbd`
