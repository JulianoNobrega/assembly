; PROGRAMA QUE COMPARA VALORES
; PRIMEIRO NÚMERO É IGUAL, MAIOR OU MENOR QUE O SEGUNDO NÚMERO?

section .data
    num1 db 7       ; PRIMEIRO NÚMERO
    num2 db 5       ; SEGUNDO NÚMERO

    equal_msg db "Equal", 10   ; Message for "Equal" case
    equal_len equ $ - equal_msg

    greater_msg db "Greater", 10 ; Message for "Greater" case
    greater_len equ $ - greater_msg

    less_msg db "Less", 10     ; Message for "Less" case
    less_len equ $ - less_msg

section .text
    global _start

_start:
    mov al, [num1] ; ATRIBUI O NÚMERO 1 NO ACUMULADOR
    cmp al, [num2] ; COMPARAÇÃO

    ; SALTOS CONDICIONAIS
    je equal        ; SALTO SE OS VALORES SÃO IGUAIS
    jg greater      ; SALTO SE O PRIMEIRO É MAIOR QUE O SEGUNDO (ZF and SF flags are clear, OF flag is clear)
    jl less         ; SALTO SE O PRIMEIRO É MENOR (SF flag is set, OF flag is clear)

equal:
    mov eax, 4       ; SYSCALL PARA sys_write
    mov ebx, 1       ; DESCRIÇÃO DE SAÍDA 1 (stdout)
    mov ecx, equal_msg  ; MENSAGEM
    mov edx, equal_len  ; COMPRIMENTO DA MENSAGEM
    int 0x80         ; INTERRUPÇÃO/SYSCALL
    jmp exit

greater:
    mov eax, 4
    mov ebx, 1
    mov ecx, greater_msg
    mov edx, greater_len
    int 0x80
    jmp exit

less:
    mov eax, 4
    mov ebx, 1
    mov ecx, less_msg
    mov edx, less_len
    int 0x80
    jmp exit

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80