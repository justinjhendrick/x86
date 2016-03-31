# Echo the command line arguments back to the user

.section .data
NEWLINE: .string "\n"

.section .text
  .globl  main
main:
  pushq  %rbp
  movq  %rsp, %rbp

  movq $0, %rax
  pushq %rax
  addq $1, (%rsp)

  popq %rax

exit:
  popq  %rbp
  ret
