global main
extern puts

section .text

main:
  mov rdi, message
  call puts wrt ..plt
  ret

message:
  db "Hello, C!", 0x0
