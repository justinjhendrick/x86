.section .data
msg: .string "Hello,\0 world!\n"
  # include \0 as a reminder that strings ending in \0 is a C thing.

.section .text
  .globl  main
main:
  pushq  %rbp
  movq  %rsp, %rbp
  
  movq $1, %rdi # write to stdout
  movq $msg, %rsi # ptr to string
  movq $15, %rdx # length of string
  movq $1, %rax # value for syscall

  syscall # sys_write(unsigned int fd, const char* buf, size_t count)
  popq  %rbp
  ret
