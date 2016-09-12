#!/bin/bash

# author: edgaroliveira.dev@gmail.com
# purpose: change and run virtual machines with qemu
# date: 11/09/2016
# version: 1.0
# Font: http://dhruvvyas.com/blog/?p=49 -> automation of tasks in this post

## How this script works:
# put this script in empty folder
# Download all imgages (in formatted .img) of you want run to this new empty folder
# Run this script, following the instructions and be happy

sudo apt-get update -y
sudo apt-get install git -y
sudo apt-get install gemu-system -y
git clone https://github.com/dhruvvyas90/qemu-rpi-kernel.git
mv qemu-rpi-kernel/* .
sudo rm -r qemu-rpi-kernel
## Carregar para um array o resultado do ls e listar para escolher opcoes
array=($(ls *.img))
for (( i=0; i<${#array[@]}; i++ ));
do
	echo $i - ${array[$i]}
done
echo "Choose one of the above, please!"
read answer
choose="$(echo ${array[$answer]} | grep -o formatted)"
## Verificar se tem o padrao no nome "formatted"
if [ $choose == formatted ]; 
then
	qemu-system-arm -kernel kernel-qemu-4.1.7-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ${array[$answer]} 
else
	value="$(fdisk -l ${array[$answer]} | grep -o -i -P 'img2\s+[0-9]+[^0-9]' | sed -r -e 's/img2 +//g')"
	multiple=512
	reulstmultiply=$((value * multiple))
	mkdir folder_mount
	sudo mount -v -o offset=$reulstmultiply -t ext4 ${array[$answer]} folder_mount
	##Comentar todas as linhas
	sudo sed -i 's/^/#/g' folder_mount/etc/ld.so.preload
	##Comentar apenas as linhas com determinado padrao
	sudo sed -i '/dev\/mmcblk/ s?^?#?' folder_mount/etc/fstab
	sudo umount folder_mount
	rmdir folder_mount
	#add this tag in name img "formatted"
	mv ${array[$answer]} formatted_${array[$answer]}
	#Execute qemu
	qemu-system-arm -kernel kernel-qemu-4.1.7-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda formatted_${array[$answer]} 
fi
