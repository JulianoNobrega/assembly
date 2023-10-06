; IMPRIME A SEQUENCIA DE 1 a 50

section .data
    newline db 10       ; Newline character
    newline_len equ $ - newline

section .text
    global _start

_start:
    mov ecx, 1          ; Inicialize ecx com 1 (início da sequência)

print_loop:
    ; Empilhe o valor em ECX (o número atual)
    push ecx

    ; Chame a função de impressão
    call print_number

    ; Desempilhe o valor empilhado anteriormente
    pop ecx

    ; Print a newline character
    mov eax, 4          ; Syscall number for sys_write
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, newline    ; Pointer to the newline character
    mov edx, newline_len  ; Length of the newline character
    int 0x80            ; Interrupt to invoke syscall

    ; Increment ECX (move para o próximo número)
    inc ecx

    ; Verifique se atingimos 51 (final da sequência)
    cmp ecx, 51
    jnz print_loop      ; Se não, repita o loop

exit:
    ; Sair do programa
    mov eax, 1          ; Syscall number for sys_exit
    xor ebx, ebx        ; Status de saída: 0 (sem erro)
    int 0x80            ; Interrupção para invocar a chamada de sistema

print_number:
    ; Sub-rotina para imprimir um número em ECX
    pusha               ; Salve os registradores
    mov eax, ecx        ; Copie ECX para EAX
    mov ebx, 10         ; Divisor (caractere de nova linha)
    xor edx, edx        ; Limpe qualquer resto anterior
    div ebx             ; Divida EAX por EBX; resultado em EAX, resto em EDX

    ; Converta o dígito em EAX para ASCII e imprima
    add al, '0'         ; Converta para ASCII
    mov ecx, eax        ; Copie o dígito ASCII para ECX
    mov eax, 4          ; Número de chamada de sistema para sys_write
    mov ebx, 1          ; Descritor de arquivo 1 (stdout)
    lea edx, [ecx]      ; Carregue o endereço do dígito em EDX
    mov ecx, 1          ; Número de caracteres a serem escritos (1)
    int 0x80            ; Interrupção para invocar a chamada de sistema

    popa                ; Restaure os registradores
    ret
