# Echo the command line arguments back to the user

.section .data
NEWLINE: .string "\n"

.section .text
  .globl  main
main:
  pushq  %rbp
  movq  %rsp, %rbp
  
  movq %rdi, %rbx # save int argc
  movq %rsi, %r12 # save char* argv[]
  movq $0, %r13   # r13 holds i for argv[i]

outer:
  # if (i == argc) return;
  cmp %r13, %rbx
  je exit

  movq (%r12, %r13, 8), %rsi

  # find number of bytes until the zero byte (put into $rdx)
  movq $0, %rdx
inner:
  mov (%rdx, %rsi), %al
  cmp $0, %al
  je print
  inc %rdx
  jmp inner

print:
  mov $1, %rdi # stdout
  movq $1, %rax # value for syscall
  syscall # sys_write(unsigned int fd, const char* buf, size_t count)

  # write a newline after each word
  movq $1, %rdi # stdout
  movq $1, %rax # value for syscall
  movq $NEWLINE, %rsi
  movq $1, %rdx # length
  syscall # sys_write(unsigned int fd, const char* buf, size_t count)

  # proceed to next word
  inc %r13
  jmp outer

exit:
  popq  %rbp
  ret
