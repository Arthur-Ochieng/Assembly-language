;loop 
;print 5 elements of an array
;but stop when  
; 3 is encountered. However the 3 is printed

;Exercise
;have two arrays of digits
;have another array that stores the result of adding the two elements at similar positions
;in the above two arrays
;print the two arrays and the result array i.e. array one 1st line, array 2 2nd line; result 3rd line
;Ensure the sum of digits does not exceed 9
;stop printing when 3 is encountered in either of the initial arrays 
;before the three and its corresponding values are printed
;you may have to use a jump in instruction rather than a loop instruction
;end of exercise

section	.text
   global _start     ;must be declared for linker (ld)
_start:	            ;tells linker entry point

   mov ecx, 0

   array_printing:

   push ecx
      ; telling the user to enter the string	
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

    pop ecx
    inc ecx
    cmp ecx, byte 5
   jle array_printing
   
   ;output end of line
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

   ;exit the program    			
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg0 db 0xa,'This is what you entered::';
msg db 0xa,'Please enter a value and terminate by pressing enter: '  ;string to be printed
len equ $ - msg     ;length of the string
   eol db 0xa	
   
