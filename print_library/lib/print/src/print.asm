extern _GLOBAL_OFFSET_TABLE_

global print:function

print:
	push rbp
	mov  rbp, rsp
	sub  rsp, 16
	push rbx
	call .get_GOT

.get_GOT:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc
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
	mov rbx, [rbp - 4]

	;   cleanup stack allocation
	add rsp, 16
	pop rbx
	pop rbp
	ret ; return

