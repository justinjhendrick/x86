  .globl  main
  .type  main, @function
.LC0:
  .string "Hello,\0 world!\n"
  # include \0 as a reminder that strings ending in \0 is a C thing.
  .text
main:
.LFB0:
  .cfi_startproc
  pushq  %rbp
  .cfi_def_cfa_offset 16
  .cfi_offset 6, -16
  movq  %rsp, %rbp
  .cfi_def_cfa_register 6
  movq $1, %rdi # write to stdout
  movq $.LC0, %rsi # ptr to string
  movq $15, %rdx # length of string
  movq $1, %rax # value for syscall
  syscall # sys_write(unsigned int fd, const char* buf, size_t count)
  popq  %rbp
  .cfi_def_cfa 7, 8
  ret
  .cfi_endproc
.LFE0:
  .size  main, .-main
  .ident  "GCC: (GNU) 4.7.4 20140401 for GNAT GPL gpl-2014 (20140405)"
  .section  .note.GNU-stack,"",@progbits
