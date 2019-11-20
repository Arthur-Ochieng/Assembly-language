;nasm -f elf lengthstring.asm && gcc -m32 -o lengthstring lengthstring.o -nostartfiles && ./lengthstring
section	.text
   global _start            ;must be declared for using gcc
   extern printf,scanf



_start:	;tell linker entry point


        ; strlen(hello)
        mov   edi, hello    ; rdi is the string we want to 
                            ; get the length of

        call  _strlen2       ; get the length!

        mov   edx, 10;eax      ; rdx now holds the string length
                            ;  ready for our write syscall

        ; write(fd, buf, len)
        add eax, '0'
        mov   ecx, eax;hello    ; the string to write

        mov   eax, 4        ; syscall 4 == write
        mov   ebx, 1        ; fd = 1 == stdout
        int   0x80          ; print the string

        call exit

        _strlen2:
        push  ebx                 ; save any registers that 
        push  ecx                 ; we will trash in here
        mov   ebx, edi            ; rbx = rdi

        xor   al, al              ; the byte that the scan will
                                ; compare to is zero

        mov   ecx, 0xffffffff     ; the maximum number of bytes
                                ; i'm assuming any string will
                                ; have is 4gb

        repne scasb               ; while [rdi] != al, keep scanning
        sub   edi, ebx            ; length = dist2 - dist1
        mov   eax, edi            ; eax now holds our length

        pop   ecx                 ; restore the saved registers
        pop   ebx
        ret                       ; all done!


        exit:
        mov eax, 1
        mov ebx, 0
        int 80h

section .data
hello db "hello world", 0
