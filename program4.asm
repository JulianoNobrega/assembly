; Parte 1 - Variáveis DEFINIDAS na memória
section .data
    x db '5' ; Variavel x = 5 (tipo DataByte)
    y db '3' ; Variavel y = 3 (tipo DataByte)
    msg db  "A soma de x e y é: " ; Mensagem (tipo DataByte)
    len equ $ - msg ; Variável Len: Recebe (inteiro) o comprimento da Strig 

; Parte 2 - Variáveis NÃO DEFINIDAS na memória
segment .bss
    sum resb 1 ; Espaço reservado na memória para a variável SUM

; Parte 3 - Código do Programa
section .text
global _start ; Seção "Main"
_start:

    mov     eax, [x] ; Atribui x ao registrador EAX
    sub     eax, '0' ; Princípio de "boas práticas"* no NASM - Subtrair 0 do registrador EAX
    mov     ebx, [y] ; Atribui y ao registrador EBX
    sub     ebx, '0' ; Princípio de "boas práticas"* no NASM - Subtrair 0 do registrador EBX
    add     eax, ebx ; SOMA dos valores, registrados em EAX (Destino)
    add     eax, '0' ; Princípio de "boas práticas"* no NASM - SOMAR 0 ao registrador EAX

    mov     [sum], eax ; Atribui a soma, presente em EAX para a variável não definida SUM

    mov     ecx, msg ; Atribui a string MSG no registrador ECX (Destino)
    mov     edx, len ; Atribui a variável LEN no registrador EDX
    mov     ebx, 1 ; Atribui o valor 1 no registrador EBX
    mov     eax, 4 ; Atribui o valor 4 no registrador EAX
    int     0x80 ; Chamada #1 de sistema - Análise do estado do processador - WRITE (Mensagem)

    mov     ecx, sum ; Atribui o valor de SUM ao registrador ECX
    mov     edx, 1 ; Atribui o valor 1 ao registrador EDX
    mov     ebx, 1 ; Atribui o valor 1 ao registrador EBX
    mov     eax, 4 ; Atribui o valor 4 ao registrador EAX
    int     0x80 ; Chamada #2 de sistema - Análise do estado do processador - WRITE (Resultado)

    mov     eax, 1 ; Atribuição do valor 1 ao registrador EAX
    int     0x80 ; Chamada #3 de sistema - Análise do estado do processador - EXIT

; * Pesquisar sobre "Boas práticas" na programação Assembly
