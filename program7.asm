; VERIFICA O MAIOR ENTRE 3 NÚMEROS E APRESENTA O VALOR

section	.data
   
   msg db "O maior numero é: "
   len equ $- msg 
   num1 dd '47'
   num2 dd '22'
   num3 dd '31'

segment .bss
   maior resb 2 

section	.text
   global _start

_start:
   mov   ecx, [num1]
   cmp   ecx, [num2]
   jg    verifica_terceiro_valor
   mov   ecx, [num2]
   
verifica_terceiro_valor:

   cmp   ecx, [num3]
   jg    exit
   mov   ecx, [num3]
   
exit:
   
   mov   [maior], ecx
   mov   ecx,msg
   mov   edx, len
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;call kernel
	
   mov   ecx,maior
   mov   edx, 2
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;call kernel
    
   mov   eax, 1
   int   80h