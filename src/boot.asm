; boot.asm - Modified to load and jump to the kernel
bits 16                      ; 16-bit real mode
org 0x7c00                   ; BIOS loads bootloader at 0x7C00


mov si, 0

print:
    mov ah, 0x0e
    mov al, [hello + si]
    int 0x10
    add si, 1
    cmp byte [hello + si], 0
    jne print

jmp $


hello:
    db 'Hello, World!', 0


times 510-($-$$) db 0        ; Pad the file with zeros
dw 0xAA55                   ; Boot signature
