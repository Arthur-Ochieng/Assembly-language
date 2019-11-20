;ask the user to enter a number, 
;if it is less than 5 small
;else print large number
;exercise
;if the number is equal or less than 3 print small number
;if the number is greater than 3 but less than 7 print avarage number
;else print large number
;end of exercise
section	.text
   global _start     ;must be declared for linker (ld)
_start:	            ;tells linker entry point

   ;msg to write
   mov ecx, msg0   
 
   ;message length
   mov	edx,msg1
   sub edx, ecx	     
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	edx,4     ;expected length of input
   mov	ecx,num     ;address to store input
   mov	ebx,2       ;file descriptor (stdin)
   mov	eax,3       ;system call number (sys_read)
   int	0x80        ;call kernel

   ;comparing
   mov	eax,0     ;initialise eax so the higher 24 bits are zero
   mov al, [num]     ;
   sub al, '0';   ;it is the ascii code of the numbe that was entered. get the actual digit
   cmp eax,3; 


   jge less ; if eax is greater than 3. Do the jump
   ;situation when number is small - no jump above
   mov edx, len4
   mov	ecx,msg4     ;message to write 
   jmp printing ;go to the printing code- ensure the greater code is not executed
   ;end of smaller	
	
  less:
    cmp eax,4; 
   jg average; if eax is less than 3. Do the jump
   ;situation when number is small - no jump above
   mov edx, len
   mov	ecx,msg2     ;message to write 
   jmp printing ;go to the printing code- ensure the greater code is not executed
   ;end of smaller	
	
   
  
    average:
   cmp eax,7;
   jg greater ; if eax is greater than 3. Do the jump
   ;situation when number is small - no jump above
   mov edx, len3
   mov	ecx,msg3     ;message to write 
   jmp printing ;go to the printing code- ensure the greater code is not executed
   ;end of smaller	
	
   ;situation when number is greater
   greater:	
      cmp eax,7;
   mov edx, msg2
   mov ecx, msg1 ; msg to write
   sub edx, ecx ; get length of the message
   ;end of greater
   
   printing:
   ;print the message that was selected. 
   ;some registers are already setup for the system call during the selection 
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   ;exit     			
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

   section	.data
   msg0 db 'Enter a number:'
   msg1 db 0xa,'Large number',0xa
   msg2 db 0xa,'Small number',0xa
   len equ $ - msg2
   msg3 db 0xa,'Average number' ,0xa
    len3 equ $ - msg3
    msg4 db 0xa,'very small number' ,0xa
    len4 equ $ - msg4
   section .bss
   num resb 1


