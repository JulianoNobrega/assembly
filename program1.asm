section .data
    hello db 'Hello, World!',0    ; Null-terminated string to be printed
    hello_len equ $ - hello       ; Length of the string

section .text
    global _start

_start:
    ; File descriptor for stdout (1)
    mov eax, 4
    mov ebx, 1
    ; Pointer to the message
    mov ecx, hello
    ; Message length
    mov edx, hello_len
    ; Invoke the sys_write syscall (syscall number 4)
    int 0x80

    ; Exit the program (syscall number 1)
    mov eax, 1
    xor ebx, ebx  ; Exit status (0)
    int 0x80