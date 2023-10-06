section .data
    number dd '5'                      
    input1 dw "Insira o numero: ", 0      
    len_input_1 equ $ - input1            
    saida dw "O menor numero e: ", 0    
    len_saida equ $ - saida               
    iguais dw "Os numeros sao iguais", 0 
    len_iguais equ $ - iguais             

section .bss
    num resd 1; reservando 2 byte para a variavel num
    menor resb 1 

; começa o código
section .text
global _start
_start: 
  mov eax, 4
  mov ebx, 1          
  mov ecx, input1     
  mov edx, len_input_1
  int 0x80
  jmp read_number  
  

; le o numero 
read_number:
  mov edx, 1
  mov ecx, num 
  mov ebx, 0
  mov eax, 3
  int 0x80
  jmp compare

; move os numeros para os registradores e compara eles
compare:
  mov eax, [number] 
  mov ebx, [num]
  cmp eax, ebx

  je numeros_iguais   ;JE  jump if equal
  jg numero1_maior    ; jg jump if greater
  jb numero1_menor     ; jb jump if less
  
numero1_maior:
  mov [menor],ebx
  jmp print1

numero1_menor:
  mov [menor], eax
  jmp print1
  
numeros_iguais:
  mov eax, 4
  mov ebx, 1 
  mov ecx, iguais
  mov edx, len_iguais
  int 0x80 
  jmp end

; mostra a mensagem e chama para mostrar o numero menor 
print1:
  mov eax, 4
  mov ebx, 1 
  mov ecx, saida 
  mov edx, len_saida
  int 0x80
  jmp print_number

print_number:
  
  mov eax, 4
  mov ebx, 1 
  mov ecx, menor
  mov edx, 1
  int 0x80
  jmp end
  
; termina o programa
end:
  mov eax, 1
  xor ebx, ebx
  int 0x80
