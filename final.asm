;nasm -f elf five.asm && gcc -m32 -o five five.o -nostartfiles && ./five


section .text
global _start

_start:

mov al,21
mov bl,5
div bl

mov bl,al
add bl, byte '0'

cmp ah,0
je multiple
jne notmul

multiple:
mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,len3
int 80h

jmp else

section .data
msg3 db "Multiple of 5"
len3 equ $ - msg3