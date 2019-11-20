;nasm -f elf test.asm && gcc -m32 test.o -nostartfiles -o test && ./test

section .text
global _start


_start:


section .bss



section .data