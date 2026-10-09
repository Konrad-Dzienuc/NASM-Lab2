global _start

section .text
_start:

    mov rcx, 10

    petla:
        add rax, rcx
        loop petla

    xor rdi, rdi
    syscall
