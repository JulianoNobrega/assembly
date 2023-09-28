; Parte 1 - Variáveis DEFINIDAS
section .data
    x db '5' ; Variavel x = 5
    y db '3' ; Variavel y = 3
    msg db  "A soma de x e y é: " ; Mensagem
    len equ $ - msg ; Variável Len: Comprimento da Strig

; Parte 2 - Variáveis NÃO DEFINIDAS
segment .bss
    sum resb 1 ; Variável SUM 

; Parte 3 - Código do Programa
section .text
global _start ; Seção "Main"
_start:

    mov     eax, [x] ; Atribui x ao registrador EAX
    sub     eax, '0' ; 
    mov     ebx, [y] ; Atribui y ao registrador EBX
    sub     ebx, '0' ; 
    add     eax, ebx ; SOMA dos valores, registrados em EAX (Destino)
    add     eax, '0' ; 

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