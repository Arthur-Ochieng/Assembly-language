section .text
   global _start     ;must be declared for linker (ld)
_start:             ;tells linker entry point

  mov ecx,9
  add:
  mov ebx,0
  mov eax, [array1+ecx-1]
  add eax, [array2+ecx-1]
  mov [total+ecx-1],byte al
  loop add

   mov ecx, 9
   mov edi,array1     ; address of array

   array_printing:
   mov esi, ecx 
   mov cl, [edi] 
   add cl, '0'
   mov [value], cl
   mov ecx, value

   ;message length 
   mov  edx,2
   mov  ebx,1 
   mov  eax,4
   int  0x80

   mov ecx, esi   ;reset ecx to be used for printing loop
   inc edi        ; go to next item of the array
   
   mov eax,0
   mov eax, edi
   sub eax,array1
   mov [hold], byte al
   cmp [edi-1], byte 3
   je next
   cmp [edi-1], byte 2
   je next
   loopne array_printing

 next:  
   ;output end of line
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, [hold]
    mov edi, array2
    array_print:
    mov esi, ecx
    mov cl, [edi]
    add cl, '0'
    mov [value], cl

    mov ecx, value
    mov edx, 2      ;message length
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, esi
    inc edi
     mov eax,0
   mov eax, edi
   sub eax,array1
   mov [hold], byte al
   cmp [edi-1], byte 3
   je next1
   cmp [edi-1], byte 2
   je next1
   loop array_print

   next1:
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, [hold]
    mov edi, total
    array_print2:
    mov esi, ecx
    mov cl, [edi]
    add cl, '0'
    mov [value], cl

    mov ecx, value
    mov edx, 2      ;message length
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, esi
    inc edi
   mov eax,0
   mov eax, edi
   sub eax,array1
   mov [hold], byte al
   cmp [edi-1], byte 3
   je exit
   cmp [edi-1], byte 2
   je exit
   loop array_print2
exit:
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80


   ;exit the program          
   mov  eax,1       ;system call number (sys_exit)
   int  0x80        ;call kernel

   section  .data
   array1 db 4, 7, 1, 3, 2,4,2,3,2
   len equ $-array1
   array2 db 4,1,1,6,7,1,1,1,1
   len2 equ $-array2
   value db '  '; value to print. two spaces. the first space will be replaced by the value to print
   eol db 0xa 
   i db 0

   section .bss
   total resb 9
   hold resb 1