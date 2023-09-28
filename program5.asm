; COMPARANDO VALORE DOS REGISTRADORES

; Parte 1 - Variáveis DEFINIDAS na memória
section .data
    numero1 db 5   ; Primeiro número
    numero2 db 6   ; Segundo número
    mensagem1 db "O maior número é: ", 0
    mensagem2 db "Os dois números são iguais!", 0

; Parte 2 - Código do Programa
section .text
global _start
_start:

    ; Carregando os valores nos registradores
    mov EAX, [numero1]
    mov EBX, [numero2]

    ; Comparando os valores
    cmp EAX, EBX
    je equal ; CASO 1: Se os valores são IGUAIS, salto para a seção "equal"

    ; CASO 2: Se o primeiro número for MAIOR que o segundo, imprimir o primeiro número
    jg numero1_e_maior ; JG = Jumper Greater
    mov EAX, EBX ; Atribui o valor do registrador EBX no registrador EAX
    jmp print ; Instrução "Jumper" vai para seção "Print"

; Seção nova, quando o número 1 é maior.
numero1_e_maior:
    mov EAX, [numero1]
    jmp print ; Instrução "Jumper" vai para a seção "print"

; Seção chamada quando os dois valores são iguais
equal:
    mov EAX, 4
    mov EBX, 1
    mov ECX, mensagem2
    mov EDX, 27
    int 0x80 ; Syscall para WRITE
    jmp end ; Salto para a seção END

; Impressão do maior número
print:
    ; Imprimir o valor no EAX
    mov EBX, EAX
    mov EAX, 4 ; Código da Syscall
    mov ECX, mensagem1 ; String da memória
    mov EDX, 18 ; Comprimento da STRING
    int 0x80 ; Syscall para WRITE

end:
    ; Finalizando o programa
    mov EAX, 1 ; Atribuição do valor 1 no registrador ACUMULADOR
    int 0x80 ; Syscall para EXIT