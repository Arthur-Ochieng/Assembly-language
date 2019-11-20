section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point

    mov ecx,a
    mov edx,1
    mov ebx,2
    mov eax,3
    int 80h


   mov	ax,[a]

   ;;Dividend
   xor  dx, dx
   ;mov	ax,'8'
   sub     ax, '0' 

   ;;Divisor
   mov 	cx, '3'
   sub     cx, '0'
   div 	cx

   add	ax, '0'
   add dx, '0'
	
   push dx
   push ax

   mov edx,len
   mov ecx,msg
   mov eax,4
   mov ebx,1
   int 0x80

   pop ax
   mov 	[res], ax
   mov	ecx,res
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

   mov edx,len2
   mov ecx,msg2
   mov eax,4
   mov ebx,1
   int 0x80

   pop dx
   mov 	[rem], dx
   mov	ecx,rem
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
	
   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
	
section .data
msg db "The result is:", 0xA,0xD 
len equ $- msg   
msg2 db "The remainder is:", 0xA,0xD 
len2 equ $- msg2  

segment .bss
res resb 1
rem resb 1
a resq 1