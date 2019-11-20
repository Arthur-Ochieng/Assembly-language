
;;;;;;;;;;;;;;;Add Three;;;;;;;;;;;;;;;;;;;;;;
   ;add some value to the number
   lea ecx,[num] ;get the second item again (Address)
   add [num], byte 3 ; and 3 to the item in the second position
   add [num],byte '0';

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
   add [num], byte 3 ; and 3 to the item in the second position
   add [num],byte '0';

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
   add [num], byte 3 ; and 3 to the item in the second position
   add [num],byte '0';

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


