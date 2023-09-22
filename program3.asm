section .data
    format db "Sum: %d",10,0 ; Format string for printf

section .bss
    num1 resd 1              ; Reserve space for the first number
    num2 resd 1              ; Reserve space for the second number
    sum resd 1               ; Reserve space for the sum

section .text
    global main
    extern printf
    extern scanf

main:
    pushad                   ; Push all general-purpose registers onto the stack

    ; Input the first number
    push num1                ; Push the address of num1 onto the stack (parameter for scanf)
    push format              ; Push the address of the format string onto the stack
    call scanf              ; Call scanf function
    add esp, 8               ; Clean up the stack (remove the two pushed parameters)

    ; Input the second number
    push num2                ; Push the address of num2 onto the stack (parameter for scanf)
    push format              ; Push the address of the format string onto the stack
    call scanf              ; Call scanf function
    add esp, 8               ; Clean up the stack (remove the two pushed parameters)

    ; Calculate the sum
    mov eax, [num1]          ; Load the first number into EAX
    add eax, [num2]          ; Add the second number to EAX
    mov [sum], eax           ; Store the result in the 'sum' variable

    ; Display the result
    push dword [sum]         ; Push the address of 'sum' onto the stack (parameter for printf)
    push format              ; Push the address of the format string onto the stack
    call printf             ; Call printf function
    add esp, 8               ; Clean up the stack (remove the two pushed parameters)

    popad                    ; Restore all general-purpose registers
    ret                      ; Return from the main function
