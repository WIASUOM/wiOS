#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/wiOS.kernel isodir/boot/wiOS.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "wiOS" {
	multiboot /boot/wiOS.kernel
}
EOF
grub-mkrescue -o wiOS.iso isodir
