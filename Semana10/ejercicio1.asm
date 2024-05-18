section .data
    msg db "El total de la resta es: "
    len_msg equ $-msg
    newline db 10

section .text
    global _start

_start:
    
    mov ax, 100      ; Primer entero (100)
    mov bx, 10       ; Segundo entero (30)
    mov cx, 15       ; Tercer entero (30)

    ; Realizar la resta utilizando negación y suma
    neg bx           
    neg cx           
    add ax, bx       
    add ax, cx       

    
    mov bl, 10       
    div bl           
    add al, '0'     
    mov [resultado], al
    add ah, '0'     
    mov [resultado + 1], ah

    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len_msg
    int 80h

   
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2      
    int 80h

   
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 80h

    
    mov eax, 1
    mov ebx, 0
    int 80h

section .bss
    resultado resb 2 
