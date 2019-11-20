;ask a user to enter a string, read it then echo it
; now modify the program so that the user enters two strings
;the two strings are concatenated into one before being output.
section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   ; telling the user to enter the string	
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;reading the string	
   mov	edx,30     ;message length
   mov	ecx,value  ; where value read will be stored
   mov	ebx,2       ;file descriptor (stdin)
   mov	eax,3       ;system call number (sys_read)
   int	0x80        ;call kernel
   mov [length], al  ; the number of bytes actually read

   ; echo the string
   mov	edx,msg     ;msg address
   sub edx,msg0	     ; get the length of msg0
   mov	ecx,msg0     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   ; now the actual value entered
   mov	edx,[length]
   mov	ecx,value
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   ;exit the program    			
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg0 db 0xa,'This is what you entered::';
msg db 0xa,'Please enter a value and terminate by pressing enter: '  ;string to be printed
len equ $ - msg     ;length of the string

section .bss
value resb 30; space for 30 characters including end of line
length resb 1;

