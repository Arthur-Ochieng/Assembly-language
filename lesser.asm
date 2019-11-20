section .text
 
global _start
 
extern printf,scanf
 
print:
mov eax,4
mov ebx,1
int 0x80
ret
 
_start: ;Main function
 
;For the first operand
mov ecx,inputa 
mov edx,linputa
call print
 
;Gets the first operand
;scanf("%lf",&a)
push a
push scan
call scanf

;For the second operand
mov ecx,inputc
mov edx,linputc
call print

;Gets the second operand
;scanf("%lf",&c)
push c
push scan
call scanf

;
mov word[const],4
 
 
multipication:
fld qword[a]
fld qword[c]


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


fdiv st1
fstp qword[x1]
 
 
push dword[x1+4]
push dword[x1]
call printf
 
 
mov eax,1
mov ebx,0
int 0x80
 
section .bss
x1 resq 1
x2 resq 1
const resw 1
a resq 1
c resq 1

section .data
scan db "%lf",0
msg db  "The number is %f is lesser",0xa,0x0
 
inputa db "Enter the first number  ",10
linputa equ $-inputa

inputc db "Enter the second number ",10
linputc equ $-inputc
