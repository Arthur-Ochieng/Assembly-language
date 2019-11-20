;ask a user to enter a string, read it then echo it
; now modify the program so that the user enters two strings
;the two strings are concatenated into one before being output.
section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   ; telling the user to enter the string	
   mov	edx,len     ;message length
   mov	ecx,promptone     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;reading the string	
   mov	edx,30     ;message length
   mov	ecx,firstname  ; where firstname read will be stored
   mov	ebx,2       ;file descriptor (stdin)
   mov	eax,3       ;system call number (sys_read)
   int	0x80        ;call kernel
   mov [length], al  ; the number of bytes actually read


     ; telling the user to enter the string	
   mov	edx,len     ;message length
   mov	ecx,promptwo     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

      ;reading the string	
   mov	edx,30     ;message length
   mov	ecx,secondname  ; where firstname read will be stored
   mov	ebx,2       ;file descriptor (stdin)
   mov	eax,3       ;system call number (sys_read)
   int	0x80        ;call kernel
   mov [length], al  ; the number of bytes actually read


	
   ; now the actual firstname entered
   mov	edx,[length]
   mov	ecx,firstname
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

; now the actual firstname entered
   mov	edx,[length]
   mov	ecx,secondname
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   

   ;exit the program    			
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg0 db 0xa,'Hello ';
promptone db 0xa,'Please your Firstname '  ;string to be printed
promptwo db 0xa,'Please your Secondname '  ;string to be printed
len equ $ - promptone     ;length of the string

section .bss
firstname resb 30; space for 30 characters including end of line
secondname resb 30; space for 30 characters including end of line
length resb 1;


;nasm -f elf tutorial.asm
;ld -m elf_i386 -s -o tutorial tutorial.o