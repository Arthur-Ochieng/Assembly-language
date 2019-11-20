;nasm -f elf power.asm && ld -m elf_i386 -o power power.o && ./power
;nasm -f elf power.asm && gcc -nostartfiles -m32 -o power power.o && ./power
section	.text
   global _start     ;must be declared for linker (ld)
   
extern printf,scanf

_start:	            ;tells linker entry point

   push    dword prompt	; address of ctrl string
   call    printf		; Call C function

   ;Gets the first operand
   ;scanf("%lf",&number)
   push numb
   push scanfld
   call scanf

   push    dword power	; address of ctrl string
   call    printf		; Call C function

   ;Gets the first operand
   ;scanf("%lf",&number)
   push number
   push scan
   call scanf

   mov ecx,[number]

   fld qword[numb]
   print:
   push ecx


   fmul qword[numb]

   pop ecx
   dec ecx 
   cmp ecx,1
   jg print

   fstp qword[answer]

   push dword[answer+4]
   push dword[answer]
   push oneroot
   call printf
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data

oneroot db "Resullt = %f",10,0 

scan db "%d",0
power:    db "Enter the power", 10, 0 ; The printf format, "\n",'0'

scanfld db "%lf",0
prompt:    db "Enter a number", 10, 0 ; The printf format, "\n",'0'

section .bss
answer resq 1
number resq 1
numb resq 1