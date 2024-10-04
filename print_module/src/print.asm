global print

print:
	push rbp
	mov  rbp, rsp
	sub  rsp, 16

	;   move char* str and int len into the stack
	mov qword [rbp - 8], rdi
	mov dword [rbp - 12], esi

	;       setup syscall write method
	mov     rax, 1; method 1 -> == write
	mov     rdi, 1; buffer to write to -> 1 == std out
	mov     rsi, qword [rbp-8]; char* buffer to write -> str
	mov     edx, dword [rbp - 12]; count of chars to write -> len
	syscall ; call write

	;   return 0 -> xor eax, eax == 0
	xor eax, eax

	;   cleanup stack allocation
	add rsp, 16
	pop rbp
	ret ; return

