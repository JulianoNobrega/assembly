; ===================================
; COMPARANDO VALORE DOS REGISTRADORES
; ===================================

; Parte 1 - Variáveis DEFINIDAS na memória
section .data
    numero1 dd '2' ; Preferencialmente entre 0 e 9
    numero2 dd '3' ; Preferencialmente entre 0 e 9
    mensagem1 db "O maior número é: ", 0
    mensagem2 db "Os dois números são iguais!", 0

; Parte 2 - Variável NÃO-DEFINIDA que vai guardar o maior número
segment .bss
    maior_numero resb 1 ; Espaço reservado na memória para a variável maior_numero
    
; Parte 3 - Código do Programa
section .text
global _start
_start:
    mov eax, [numero1] ; Carregando valor no registrador EAX
    mov ebx, [numero2] ; Carregando valor no registrador EBX
    cmp eax, ebx ; Instrução de COMPARAÇÃO dos registradores EAX e EBX
    
    je numeros_iguais ; CASO 1 (Jump If Equal) salta para outra seção "numeros iguais" e FINALIZA o programa
    jg numero1_e_maior ; CASO 2 (Jumper If Greater), quando o primeiro numero é maior, salta para outra seção 
    jb numero2_e_maior ; CASO 3 (Jumber If Less), quando o segundo numero é maior, salta para outra seção

numero2_e_maior: ; CASO 3
    mov [maior_numero], ebx ; A variável não definida recebe o valor do EBX
    jmp print

numero1_e_maior: ; CASO 2
    mov [maior_numero], eax ; A variável não definida recebe o valor do EAX
    jmp print ; SALTO/JUMP para a seção Print

numeros_iguais: ; CASO 1
    mov eax, 4
    mov ebx, 1
    mov ecx, mensagem2
    mov edx, 29 ; Comprimento da STRING
    int 0x80
    jmp end ; Finaliza o programa

print: ; PRINT da mensagem, do maior número
    mov eax, 4
    mov ebx, 1
    mov ecx, mensagem1
    mov edx, 20 ; Comprimento da STRING
    int 0x80 ; Syscall para WRITE
    jmp print2 ; SALTO/JUMP para a seção Print2

print2: 
    mov eax, 4
    mov ebx, 1
    mov ecx, maior_numero
    mov edx, 1 ; Comprimento da STRING
    int 0x80 ; Syscall para WRITE
    jmp end ; Finaliza o programa

end: ; Finaliza o programa
    mov eax, 1
    xor ebx, ebx 
    int 0x80 ; Syscall para EXIT