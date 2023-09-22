section .data
    numero db 10,0xa
    numero_len equ $ - numero      

section .text
    global _start
_start:

    mov eax, 4 ; Registrador EAX recebe o valor 4
    mov ebx, 1 ; Registrador EBX recebe o valor 1

    mov ecx, numero
    mov edx, numero_len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80