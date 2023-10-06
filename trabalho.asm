section .data
    num dd '5'
    msg1 db "Digite um numero: ", 0
    msg2 db "Numeros iguais!", 0
    msg3 db "O menor numero é: ", 0
    len1 equ $ - msg1
    len2 equ $ - msg2
    len3 equ $ - msg3
    
segment .bss
    entrada resd 1
    menor resd 1

section .text
global _start

_start:
    ;mensagem
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

   ;pega o valor do usuario
   mov eax, 3
   mov ebx, 0
   mov ecx, entrada
   mov edx, 1
   int 0x80
   
   mov eax, [entrada]
   mov ebx, [num]
   cmp eax, ebx
   
   je num_iguais
   jl num1_menor
   jg num2_menor
   
num_iguais:
   mov eax, 4
   mov ebx, 1
   mov ecx, msg2
   mov edx, len2
   int 0x80
   jmp end

num1_menor:
    mov [menor], eax
    jmp print
   
num2_menor:
    mov [menor], ebx
    jmp print

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 0x80
    jmp print_num
    
print_num:
    mov eax, 4
    mov ebx, 1
    mov ecx, menor
    mov edx, 1
    int 0x80
    jmp end

end:
    mov eax, 1
    xor eax, ebx
    int 0x80