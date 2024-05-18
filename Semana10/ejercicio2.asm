section .data
    factor1 db 8 
    factor2 db 9
    mensaje db 'Resultado: ', 0
    resultado db 0, 0 

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, 11
    int 0x80

    mov al, [factor1]
    mul byte [factor2]

    mov bl, 10
    div bl
    add al, '0'
    mov [resultado], al

    add ah, '0'
    mov [resultado+1], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

