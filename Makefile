bootsector.o: bootsector.s
	as bootsector.s -o ./build/bootsector.o

bootsector: bootsector.o
	ld -Ttext=0x7c00 ./build/bootsector.o -o ./build/bootsector

bootsector.bin: bootsector
	objcopy -O binary ./build/bootsector ./build/bootsector.bin

gdb: bootsector.bin
	xterm -e bash -title "Bootloader VM" -c "qemu-system-i386 -hda ./build/bootsector.bin -s -s" &