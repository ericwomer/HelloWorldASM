SECTION .data
msg db 'Hello, 64bit!', 0xA

SECTION .text
global _start

_start:
  mov rax, msg
  call strlen

  mov rsi, 0x1
  mov rsi, msg
  mov rdx, rax 
  mov rax, 0x1
  syscall
  jmp quit

strlen:
  push rbx
  mov rbx, rax 

nextchar:
  cmp byte[rax], 0
  jz finish
  inc rax
  jmp nextchar

finish:
  sub rax, rbx
  pop rbx
  ret

quit:
  mov rax, 0x3c 
  syscall
