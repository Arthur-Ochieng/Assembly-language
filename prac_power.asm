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


mov word[const],4
 
 
multipication:
fld qword[a]
fld qword[c]

fmul st1
fstp qword[x1]
 
 
push dword[x1+4]
push dword[x1]
push oneroot
call printf
 
 
over:
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
oneroot db "Resullt = %f",10,0 
 
inputa db "Enter the base :  ",10
linputa equ $-inputa

inputc db "Enter the power : ",10
linputc equ $-inputc
