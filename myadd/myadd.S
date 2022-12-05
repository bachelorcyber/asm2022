global myadd

section .text

myadd:
    add rsi,rdi
    mov rax,rsi
    ret