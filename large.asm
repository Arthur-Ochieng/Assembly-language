section	.text
   global _start     ;must be declared for linker (ld)

_start:	            ;tells linker entry point

   mov ecx, 5
   mov edi,nums; address of array

   array_printing:
   ;edi is used to keep track of the array item positions
   mov esi, ecx ;save ecx so we can use it for output
   
   
    cmp large, [edi]
    jg replace

    replace:
    mov large,[edi]
    mov index,ecx

   mov cl, [edi] ;array item to print in edi
   add cl, '0' ;to ASCII - changes item in register
   mov [value], cl ; store ascii code to print in first byte of value. Second byte has space


   mov ecx, value ; address of value to print. the value and the space    ;message length 
   mov	edx,2
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
 
   mov ecx, esi ;reset ecx to be used for printing loop
   inc edi ; go to next item of the array
   cmp [edi-1], byte 3
   loopne array_printing
   
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
   nums db 5, 7, 9, 3, 2
   len equ $-nums
   large db 0
   index db 0
   value db '  '; value to print. two spaces. the first space will be replaced by the value to print
   eol db 0xa	
   
