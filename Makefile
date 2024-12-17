default:
	nasm src/boot.asm -o build/boot

run:
	qemu-system-i386 build/boot
