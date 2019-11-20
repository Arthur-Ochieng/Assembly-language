  global _start     ;must be declared for linker (ld)
_start:	            ;tells linker entry point

  mov edx,lenmsg1
  mov ecx,msg1
  mov ebx,1
  mov eax, 4
  int 80h

;addition
	mov ecx, 5
	add:
	mov eax, [array1+ecx-1]
	add eax, [array2 + ecx-1]
	mov [total+ecx-1],eax
	loop add

   mov ecx, 5
   mov edi,array1		; address of array
   array_printing:		;edi is used to keep track of the array item positions
   mov esi, ecx 		;save ecx so we can use it for output
   mov cl, [edi]		 ;array item to print in edi
   add cl, '0'		 ;to ASCII - changes item in register
   mov [value], cl 	; store ascii code to print in first byte of value. Second byte has space
   mov ecx, value	 ; address of value to print. the value and the space




 ;message length 
   mov	edx,2
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   mov ecx, esi 	;reset ecx to be used for printing loop
   inc edi 			; go to next item of the array
   loop array_printing
   
 ;output end of line
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, 5
   mov edi,array2		; address of array
   array_print:		;edi is used to keep track of the array item positions
   mov esi, ecx 
   mov cl, [edi]
   add cl, '0'
   mov [value], cl
   mov ecx, value

 ;message length 
   mov	edx,2
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   mov ecx, esi 	;reset ecx to be used for printing loop
   inc edi 			; go to next item of the array
   loop array_print
   
 ;output end of line
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80



;printing
	mov ecx,5
	mov edi, total
   print:		;edi is used to keep track of the array item positions
   mov esi,ecx
   mov cl, [edi]
   add cl, '0'
   mov [value], cl
   mov ecx, value



 ;message length 
   mov	edx,2
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   mov ecx, esi 	;reset ecx to be used for printing loop
   inc edi 			; go to next item of the array
   loop print
   
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
  msg1 db 'The first array:',0xa
  lenmsg1 equ $-msg1
  
  msg2 db 'The second array ',0xa
  lenmsg2 equ $-msg2
   
   array1 db 4, 6, 5, 2, 3
   lenarray1 equ $-array1

   array2 db 2, 1, 4, 5, 6
   lenarray2 equ $-array2

   value db '  '; value to print. two spaces. the first space will be replaced by the value to print
   eol db 0xa	

   section .bss
   total resb 5
