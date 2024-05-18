section .data
    mensaje db 0xA,0xD,"El resultado es: "
    longitud_mensaje equ $-mensaje
section .bss
    resultado resb 1
section .text
    global _start

_start:
    mov ebx, 4
    mov eax, 20
    mov edx, 0
    div ebx
    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, longitud_mensaje
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

