SRC=src
BUILD=build


all: ISO



ISO: myos.bin
	grub-mkrescue -o wiOS.iso isoroot


myos.bin: boot.o kernel.o
	i686-elf-gcc -T $(SRC)/linker.ld -o isoroot/boot/wiOS.bin -ffreestanding -O2 -nostdlib $(BUILD)/boot.o $(BUILD)/kernel.o -lgcc


boot.o:
	i686-elf-as $(SRC)/boot.s -o $(BUILD)/boot.o
	

kernel.o:
	i686-elf-gcc -c $(SRC)/kernel.c -o $(BUILD)/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra


check:
	./check.sh

run:
	qemu-system-i386 -cdrom wiOS.iso


clean:
	rm -rf $(BUILD)/*  wiOS.iso isoroot/boot/wiOS.bin
