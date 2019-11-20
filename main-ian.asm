section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,1     ;message length
   add [num],byte '0'  ;for asci operation
   mov	ecx,num     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   sub [num], byte '0'  ;for asci operation	

   ;EOL
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;add some value to the number
   add [num], byte 3
   add [num],byte '0'  ;for asci operation
   mov	edx,1     ;message length
   mov	ecx,num     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
   sub [num], byte '0'  ;for asci operation	
   ;exit the program    			
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
num db 5
eol db 0xa


