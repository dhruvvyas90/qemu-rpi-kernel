In this subsection, I've included tools and instructions for those who want to build kernel themselves.

`build-kernel-qemu` script helps one to automate kernel building process for any debian based distro.
The ARM toolchain can be found at https://github.com/raspberrypi/tools if not available for your distro.
For other OSes, like windows or Mac OS X, one can have similar tools like gcc-arm-linux-gnueabihf- and other dependencies and refer `build-kernel-qemu` line by line to build the kernel.

If you enable USB webcam modules in the build script, make sure that the correct drivers for your web camera are selected in menuconfig.
A word of warning, though: USB works in Qemu in general but USB web cameras have some problems actually.

== Debian/Ubuntu build instructions
1. Clone this repo and navigate to this directory
2. Create the `build-kernel-qemu.conf`, `config_file`, and `linux-arm.patch` files for the chosen kernel version.
   For example, by copying the respective versioned file.
3. Install package dependencies: `sudo apt install build-essential gcc-arm-linux-gnueabihf bison flex libncurses-dev`
4. Run `./build-kernel-qemu`
5. Make menu configuration choices as desired, or save the defaults

== Attribution

Please note that `build-kernel-qemu` is not an original work of mine and credit for it goes to the original author (https://github.com/johnlane).

I've taken building references from the links below:

- https://web.archive.org/web/20131210001638/http://xecdesign.com/compiling-a-kernel/
- https://web.archive.org/web/20131209235952/http://xecdesign.com/compiling-qemu/
- https://web.archive.org/web/20131210001407/http://xecdesign.com/working-with-qemu/
- https://web.archive.org/web/20131210001526/http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/

`build-kernel-qemu` references :

- https://github.com/johnlane/rpi-utils/blob/master/kernel/build-kernel-qemu
- https://github.com/polaco1782/raspberry-qemu/blob/master/build-kernel-qemu
