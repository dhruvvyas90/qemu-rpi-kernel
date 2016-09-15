In this subsection, I've included tools and instructions for those who want to build kernel themselves.

`build-kernel-qemu` script helps one to automate kernel building process for any debian based distro.
The ARM toolchain can be found in the debian package gcc-arm-linux-gnueabihf or at https://github.com/raspberrypi/tools. For other OSes, like windows or Mac OS X, one can have similar tools like gcc-arm-linux-gnueabihf- and other dependencies and refer `build-kernel-qemu` line by line to build the kernel.

Please note that `build-kernel-qemu` is not an original work of mine and credit for it goes to the original author (https://github.com/johnlane).

I've taken building references from the links below:

https://web.archive.org/web/20131210001638/http://xecdesign.com/compiling-a-kernel/
https://web.archive.org/web/20131209235952/http://xecdesign.com/compiling-qemu/
https://web.archive.org/web/20131210001407/http://xecdesign.com/working-with-qemu/
https://web.archive.org/web/20131210001526/http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/

`build-kernel-qemu` references :

https://github.com/johnlane/rpi-utils/blob/master/kernel/build-kernel-qemu

https://github.com/polaco1782/raspberry-qemu/blob/master/build-kernel-qemu
