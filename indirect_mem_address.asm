;Questions
;add 3 to all the elements of the array
;print the last item of the changed array
;use indirect memory addressing


section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point



;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov	edx,1     ;message length
   mov	ecx,num+3    ;address of first item in the array
   ;add ecx, 1 ; get the address of the second item

   add [ecx],byte '0';for asci operation
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   sub [ecx], byte '0';	

   ;EOL
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;New Line EOL;;;;;;;;;;;;;;;;;
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

;;;;;;;;;;;;;;;Add Three;;;;;;;;;;;;;;;;;;;;;;
   ;add some value to the number
   lea ecx,[num] ;get the second item again (Address)
   add [ecx], byte 3 ; and 3 to the item in the second position
   add [ecx],byte '0';

   mov	edx,1     ;message length

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;EOL
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

;;;;;;;;;;;;;;;Add Three;;;;;;;;;;;;;;;;;;;;;;
   ;add some value to the number
   lea ecx,[num+1] ;get the second item again (Address)
   add [ecx], byte 3 ; and 3 to the item in the second position
   add [ecx],byte '0';

   mov	edx,1     ;message length

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;EOL
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

;;;;;;;;;;;;;;;Add Three;;;;;;;;;;;;;;;;;;;;;;
   ;add some value to the number
   lea ecx,[num+2] ;get the second item again (Address)
   add [ecx], byte 3 ; and 3 to the item in the second position
   add [ecx],byte '0';

   mov	edx,1     ;message length

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;EOL
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel





;;;;;;;;;;;;;;;Add Three;;;;;;;;;;;;;;;;;;;;;;
   ;add some value to the number
   lea ecx,[num+3] ;get the second item again (Address)
   add [ecx], byte 3 ; and 3 to the item in the second position
   add [ecx],byte '0';

   mov	edx,1     ;message length

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   ;EOL
   mov	edx,1     ;message length
   mov	ecx,eol     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel





   sub [ecx], byte '0';
   ;exit the program    			
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
num db 5, 4, 3, 2 
eol db 0xa
