section .data
    ; Define the two 10x10 matrices (A and B)
    matrixA dq 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
             dq 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0,
             dq 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0,
             dq 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0,
             dq 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0,
             dq 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0,
             dq 61.0, 62.0, 63.0, 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0,
             dq 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0,
             dq 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0, 88.0, 89.0, 90.0,
             dq 91.0, 92.0, 93.0, 94.0, 95.0, 96.0, 97.0, 98.0, 99.0, 100.0

    matrixB dq 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
             dq 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0,
             dq 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0,
             dq 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0,
             dq 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0,
             dq 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0,
             dq 61.0, 62.0, 63.0, 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0,
             dq 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0,
             dq 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0, 88.0, 89.0, 90.0,
             dq 91.0, 92.0, 93.0, 94.0, 95.0, 96.0, 97.0, 98.0, 99.0, 100.0

    ; Define a result matrix (C)
    matrixC times 800 dq 0.0

section .text
    global _start

_start:
    ; Initialize loop counters
    mov ecx, 10         ; Outer loop counter (rows of A)
    
outer_loop:
    push ecx            ; Save the outer loop counter

    mov edi, 0           ; Initialize C row index
    mov ebx, 0           ; Initialize B column index
    
inner_loop:
    push edi            ; Save the C row index
    push ebx            ; Save the B column index

    ; Initialize C[row][col] to 0
    movsd xmm0, qword [matrixC + edi * 80 + ebx * 8]

    mov esi, 0           ; Initialize A column index

multiply_loop:
    ; Load A[row][col] and B[col][row] into xmm1 and xmm2
    movsd xmm1, qword [matrixA + edi * 80 + esi * 8]
    movsd xmm2, qword [matrixB + ebx * 80 + esi * 8]

    ; Multiply xmm1 and xmm2, and add the result to xmm0
    mulsd xmm1, xmm2
    addsd xmm0, xmm1

    ; Update the A column index
    inc esi
    cmp esi, 10          ; Check if we've reached the end of the row
    jl multiply_loop     ; If not, continue multiplying

    ; Store the result in C[row][col]
    movsd qword [matrixC + edi * 80 + ebx * 8], xmm0

    pop ebx             ; Restore the B column index
    pop edi             ; Restore the C row index

    ; Update the B column index
    inc ebx
    cmp ebx, 10          ; Check if we've reached the end of the column
    jl