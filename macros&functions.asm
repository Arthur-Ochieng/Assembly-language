%macro write_string 2
	push eax
	push ebx
	push ecx
	push edx
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

%macro read_input 2
	push eax
	push ebx
	push ecx
	push edx
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

%macro print_input 2
	push eax
	push ebx
	push ecx
	push edx
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

%macro print_number 2
	push eax
	push ebx
	push ecx
	push edx
	mov ecx, %1
	add [ecx], byte 48
	mov edx, %2
	int 0x80
	sub [ecx],byte 48
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

%macro exiting 0
	mov eax, 1
	mov ebx, 0
	int 0x80
%endmacro

endofline:
	push eax
	push ebx
	push ecx
	push edx
	mov edx,1
	mov ecx, eol
	mov ebx, 1
	mov eax, 4
	int 0x80
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

section .data
	eol db 0xa
