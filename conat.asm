section .text
    global _start
_start:
    mov eax, [fizz]
    mov [buffer], eax
    mov eax, [buzz]
    mov [buffer+4], eax

section .data
fizz db 0xa,'fizz'
buzz db 0xa,