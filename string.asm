;nasm -f elf string.asm && gcc -m32 -o string string.o -nostartfiles && ./string
section	.text
   global _start            ;must be declared for using gcc
	extern printf,scanf

print:
mov eax,4
mov ebx,1
int 0x80
ret

_start:	;tell linker entry point


    ;Prompt user for the first String
    mov ecx,inputa 
    mov edx,linputa
    call print

    ;Gets the first operand
    ;scanf("%lf",&first_string)
    push first_string
    push scanformat
    call scanf

    ;For the second operand
    mov ecx,inputb
    mov edx,linputb
    call print

    ;Gets the second operand
    ;scanf("%lf",&second_string)
    push second_string
    push scanformat
    call scanf



    mov esi, first_string
    mov edi, second_string

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Get the length of the second string
    mov ecx, 8
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    cld
    repe  cmpsb ;Compares the two strings
    jecxz  equal             ;jump when ecx is zero

    ;If not equal then the following code
    mov ecx, msg_neq
    mov edx, len_neq
    call print
    jmp exit
        
    equal:
    ;For the first operand
    mov ecx, msg_eq
    mov edx, len_eq
    call print
    
        
    exit:
    mov eax, 1
    mov ebx, 0
    int 80h
	
section	.data
scanformat db "%s",0

inputa db "Enter the First string:  ",10
linputa equ $-inputa

inputb db "Enter the Second string:  ",10
linputb equ $-inputb

s1 db 'Hello, world!',0      ;our first string
lens1 equ $-s1

s2 db 'Hello, there!', 0     ;our second string
lens2 equ $-s2

msg_eq db 'Strings are equal!', 0xa
len_eq  equ $-msg_eq

msg_neq db 'Strings are not equal!'
len_neq equ $-msg_neq

section .bss
first_string resq 1
second_string resq 1
