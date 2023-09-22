SECTION .data
    decimal 			DB 100
    hexadecinalPos 	    DB 0AFh
    hexadecimalPre 	    DB 0xAF
    binarioPos 			DB 10101010b
    binarioPre 			DW 0b1010101011
    octalPos 			DW 777o
    octalPre 			DW 0o777

SECTION .text
GLOBAL main
main:

    MOV EAX,0
    RET
