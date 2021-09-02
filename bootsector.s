.code16
.globl _start
_start:
movb $0xe,%ah       # Display char over TTY
movb $'H',%al       # The char to display
movb $0x0, %bh      # some styling stuff
movb $0xff,%bl      # some styling stuff
int $0x10

mov 0xa000,%ds
mov 0x0000,%di

loop:
    # ds * 16 + di
    mov $0xff,%ds:(%di)
    inc %di
	jmp loop

# fill the last 2 bytes with the magic numbers
# that allows BIOS to recognize that this is a bootsector
.org 0x1fe
.word 0xaa55
