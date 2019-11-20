;nasm -f elf five.asm && gcc -m32 -o five five.o -nostartfiles && ./five
section	.text
   global _start    ;must be declared for using gcc
	
extern printf,scanf


print:
mov eax,4
mov ebx,1
int 0x80
ret   

_start:             ;tell linker entry point



    

    mov ecx,a
    mov edx,1
    mov ebx,2
    mov eax,3
    int 80h


   mov	ax,[a]
   sub   ax, '0'
	
   mov 	bl, [num]
   sub     bl, '0'
   div 	bl
   add	ax, '0'

   cmp dx, byte '0'
   jne notmult

   jmp mult
	
   mult:
   mov	ecx,mulmsg
   mov	edx, lenmul
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
   call exit

    notmult:
   mov	ecx,notmulmsg
   mov	edx, lennotmul
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

	
   exit:
   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
	
section .data
scan db "%d",0

num db 5

mulmsg db "The number is divisible by 5",0xa,0x0
lenmul equ $ - mulmsg 

notmulmsg db "The number is not divisible by 5",0xa,0x0
lennotmul equ $ - notmulmsg 

msg db "The result is:", 0xA,0xD 
len equ $- msg   

inputa db "Enter a number:  ",10
linputa equ $-inputa


segment .bss
a resq 1
res resb 1