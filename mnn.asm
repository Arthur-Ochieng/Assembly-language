  global _start     ;must be declared for linker (ld)
_start:	            ;tells linker entry point


   mov ecx, 9
   mov edi,array1		; address of array
 

   array_printing:		;edi is used to keep track of the array item positions
   mov esi, ecx 		;save ecx so we can use it for output
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    cmp [edi], byte 5
    jge final


    
    add [num], byte 1
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov cl, [edi]		 ;array item to print in edi
   add cl, '0'		 ;to ASCII - changes item in register
   mov [value], cl 	; store ascii code to print in first byte of value. Second byte has space
   mov ecx, value	 ; address of value to print. the value and the space

   ;message length 
   mov	edx,2
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel



    ;;;;;;;;;;;;;;;;;;;;;;;;;
    final:
   

    ;;;;;;;;;;;;;;;;;;;;;;;;;

   mov ecx, esi 	;reset ecx to be used for printing loop
   inc edi 			; go to next item of the array
   
   
   loop array_printing
   
 ;output end of line
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80



   mov ecx, num	 ; address of value to print. the value and the space
   ;message length 
   mov	edx,1
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

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
   
   array1 db 7, 6, 2, 8, 3, 1, 7, 8, 9
   lenarray1 equ $-array1

    num db 48

   value db '  '; value to print. two spaces. the first space will be replaced by the value to print
   eol db 0xa	

