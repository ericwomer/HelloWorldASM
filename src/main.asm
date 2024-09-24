SECTION .data
  msg db 'Hello, World!',0Ah
  ; used if we didn't have strlen
  ;msg_len equ $-msg

SECTION .text
global _start

_start:

  mov eax, msg
  call strlen

  mov edx, eax
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 80h 

  mov ebx, 0
  mov eax, 1
  int 80h

; strlen begin
strlen:
  push ebx
  mov ebx, eax

; loop
nextchar:
  cmp byte[eax], 0
  jz finished
  inc eax
  jmp nextchar

finished:
  sub eax, ebx
  pop ebx
  ret
; strlen end
