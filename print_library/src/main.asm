global _start

	;      int print(char* str, int len)
	extern print:function

	section .text

_start:
	;    stack allocation
	push rbp
	mov  rbp, rsp

	;   reserve 32 bytes (words?) onto the stack
	sub rsp, 32

	;   initialize return value as 0
	mov dword [rbp - 4], 0

	;   store address of var in registers
	lea rax, [rel hello]
	lea edx, [rel hello_len]

	;   place place address into the stack
	mov qword [rbp - 16], rax
	mov dword [rbp - 20], edx

	;   move those addresses into the call registers arguments
	mov rdi, qword [rbp - 16]
	mov esi, dword [rbp - 20]

	;    call print method
	call print WRT ..plt

	jmp quit; jump to quit:

quit:
	;   Clean up the stack allocation
	add rsp, 32
	pop rbp

	;   Setup syscall/exit
	mov rax, 0x3c
	xor rdi, rdi; 0 out return code
	syscall

	; constants

hello:
	db 'Hello, Library!', 0xA
	hello_len: equ $-hello
