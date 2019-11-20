extern scanf,printf
%include 'macros&functions.asm'
section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
	write_string msg1, len1
	push num1
	push scan
	call scanf
	pop edx
	pop edx

	write_string msg2, len2
	push num2
	push scan
	call scanf
	pop edx
	pop edx

	mov eax, [num1]
	mov ebx, [num2]
	push eax
	push ebx
	call square; call the function the first time
	mov [result], eax ; store the result which is in eax into the result variable	
	
;popout the value(s) we stored in the stack
	pop edx
	pop edx
	
;;print out the result
	
	mov eax, [result]
	push eax
	push print
	call printf
	pop edx
	pop edx

	   ;;print end of line
	  call endofline
	
	;exit the program    			
	exiting

	
square: ;define the  function
	push ebp ; store bp of the calling function so we will be able to restore it
	mov ebp, esp; set up its own base pointer from which we will access our local variables and parameters
	mov eax,[ebp+12] ; get the first  parameter passed  store it in eax
	mov edx, eax	
	mov ebx, [ebp+8] ; - second parameter
	dec ebx  ; - Decrement ebx because the multiplication happens at least once
	mov ecx, ebx
	mov edx, 0  ; - For the purpose of the comparison
       multiply:
	cmp ebx, edx ; - check to see if the exponent is 1, then exit the loop if it is 
	je skip ; - exit the loop
	dec edx  ; Decrement edx so that it is -1
	cmp ebx, edx  ; - check if the exponent is 0, then jump if it is
	jl zero
	MUL edx ; multiply al by the value in dl
	mov edx, [ebp+12]  ; - Move the number back into edx so that it can be used in the multiplication once again
       loop multiply
	
        jmp skip
	zero:
	 mov eax, 1
	skip:
	

;process of restoring bp
	mov esp,ebp ;deallocate the stack frame
	pop ebp ; restore bp for the calling function
	ret				;end of the function
   

section	.data
	msg1 db "Enter  Number: "
	len1 equ $-msg1
	msg2 db "Enter  Exponent: "
	len2 equ $-msg2
	scan db "%d", 0x0
	print db "Result: %d", 0xa, 0x0

section .bss 
	num1 resd 1
	num2 resd 1
	result resd 1
	

