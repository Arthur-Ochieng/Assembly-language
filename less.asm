extern printf

section .data
msg db  "The number is %f is lesser",0xa,0x0
num dd 16.55
num1 dd 17.5

section .text
global _start

_start:

fld DWORD[num]
fld DWORD[num1]
sub esp, 8
fcomi ; compare st0 and st1 also can use fcmpip
JC lesser ; carry set would indicate that st0 is lesser. If equal, the zero flag is set

FINCSTP ;case lesser - pop it out so we can print the next value
fstp QWORD[esp]
jmp printing

lesser:
fstp QWORD[esp]

printing:
mov eax, msg
push eax
call printf
pop eax

add esp, 8

mov ebx, 0 ; exit with a zero
mov eax, 1 ; sys_exit
int 0x80