# qemu-rpi-kernel

## Emuation using Qemu's native raspi2/3 machine

Follow instructions under `native-emulation` subfolder in order to use Qemu's
native raspi2/3 machine to emulate raspberry pi. 

## Emulation using pre-compiled versatilepb kernels

Ready-made kernels that can be used to emulate a Raspberry Pi using QEMU.

They are compiled from the same [kernel sources] used for official Raspian
images, with tweaks to make them suitable for use with QEMU, and are supposed
to be used along with official Raspbian images.

### Obtaining Raspbian

Before starting, you should download a [Raspbian image] from the Raspberry Pi
website and extract the `.zip` archive to obtain an `.img` file.

### Choosing a kernel image

This repository contains three types of kernel images:

* `kernel-qemu-4.*.*-buster` are the most recent images, which are compatible
  with Raspbian Buster and Stretch. To use these images, you'll need a compiled
  device tree file (.dtb) which is also contained in this repository.  Use
  `versatile-pb-buster.dtb` for Buster, or use `versatile-pb.dtb` for Stretch.
  Unless you are positive you need a different kernel, the most recent of
  these images is probably what you want.

* `kernel-qemu-4.*.*-stretch` are images compatible with Raspbian Stretch and
  Jessie. To use these images, you'll need the `versatile-pb.dtb` file which
  is also contained in this repository.

* `kernel-qemu-4.4.*-jessie` are images compatible with Raspbian Jessie and
  Wheezy.

* `kernel-qemu-3.10.25-wheezy` is the original image from [xecdesign.com],
  which is compatible with Raspbian Wheezy only.

### Using kernel images with QEMU

The QEMU command line will look like

    $ qemu-system-arm \
      -M versatilepb \
      -cpu arm1176 \
      -m 256 \
      -hda /.../2019-09-26-raspbian-buster-lite.img \
      -net user,hostfwd=tcp::5022-:22 \
      -dtb /.../versatile-pb-buster.dtb \
      -kernel /.../kernel-qemu-4.19.50-buster \
      -append 'root=/dev/sda2 panic=1' \
      -no-reboot

For the kernel 5.4.51 please use (Tested with Raspbian Buster Lite):

    $ qemu-system-arm \
      -M versatilepb \
      -cpu arm1176 \
      -m 256 \
      -drive "file=/.../2020-05-27-raspios-buster-lite-armhf.img,if=none,index=0,media=disk,format=raw,id=disk0" \
      -device "virtio-blk-pci,drive=disk0,disable-modern=on,disable-legacy=off" \
      -net "user,hostfwd=tcp::5022-:22" \
      -dtb /.../versatile-pb-buster-5.4.51.dtb \
      -kernel /.../kernel-qemu-5.4.51-buster \
      -append 'root=/dev/vda2 panic=1' \
      -no-reboot

with the paths to the disk image, `.dtb` file and kernel image adjusted
appropriately.

There is a Docker image available to automate this whole process:

```
docker run -it lukechilds/dockerpi
```

More information: https://github.com/lukechilds/dockerpi

### Using kernel images with libvirt

Assuming your libvirt version is at least 5.0.0, you can use something like

    $ virt-install \
      --name pi \
      --arch armv6l \
      --machine versatilepb \
      --cpu arm1176 \
      --vcpus 1 \
      --memory 256 \
      --import \
      --disk /.../2019-09-26-raspbian-buster-lite.img,format=raw,bus=virtio \
      --network user,model=virtio \
      --video vga \
      --graphics spice \
      --rng device=/dev/urandom,model=virtio \
      --boot 'dtb=/.../versatile-pb-buster.dtb,kernel=/.../kernel-qemu-4.19.50-buster,kernel_args=root=/dev/vda2 panic=1' \
      --events on_reboot=destroy

to create a new libvirt guest called `pi`. You'll be able to manage the guest
with all the usual tools, such as `virsh` and `virt-manager`.

### Building your own kernel image

See the contents of the `tools/` directory, where the build scripts and
instructions on how to use them are stored.

### Origin of this repository

While searching the Internet for information on emulating a Raspberry Pi using
QEMU in Jun 2015, most of the guides pointed to kernel images hosted on
[xecdesign.com]; however, at the time the resource was no longer online, and
that's still the case as of Feb 2019.

This repository was initially created as a way to make those kernel images
available once again, and has since been expanded to provide improved and
up-to-date images.

### Further information

Additional documentation can be found on the [wiki].

[Raspbian image]: https://www.raspberrypi.org/downloads/raspbian/
[kernel sources]: https://github.com/raspberrypi/linux/
[xecdesign.com]: https://xecdesign.com/downloads/linux-qemu/kernel-qemu
[wiki]: https://github.com/dhruvvyas90/qemu-rpi-kernel/wiki
