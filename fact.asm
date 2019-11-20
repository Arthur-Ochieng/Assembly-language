%include 'macros&functions.asm'
extern scanf, printf
section	.text
   global _start     ;must be declared for linker (ld)
_start:	
	write_string msg1, len1
	push num1
	push scan
	call scanf
	pop edx
	pop edx


        mov eax, [num1]    
	push  eax; the value whose factorial is to be found
	call factorial; call the function the first time
	mov [result], eax ; store the result which is in eax into the result variable
	
;popout the value(s) we passed to the called function
	pop edx
	
;;print out the result
	mov ecx, [result]
	push ecx
	push print
	call printf
	pop edx
	pop edx

	call endofline
	
	;exit
	exiting	

	factorial: ;define the  function
	push ebp ; store bp of the calling function so we will be able to restore it
	mov ebp, esp; set up its own base pointer from which we will access our local variables and parameters
	mov eax, [ebp+8]
	cmp eax, 0
	je returning	
	push eax
	sub eax, 1
	push eax;
	call factorial
	mov edx, [ebp-4]
	mul edx
	jmp restore	
	
	returning:
	mov eax, 1

	restore:	
	;process of restoring bp
	mov esp,ebp ;deallocate the stack frame
	pop ebp ; restore bp for the calling function
	ret				;end of the function
   

section	.data
	msg1 db "Enter  Number whose factorial you want to find: "
	len1 equ $-msg1
	scan db "%d", 0x0
	print db "Result: %d", 0xa, 0x0
	
section .bss 
	num1 resd 1
	result resd 1 
	

