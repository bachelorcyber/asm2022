global mymul

section .text


mymul:
    push rdx
    mov rax,rdi
    mul rsi
    mov r8, rax
    mov r9, rdx
    pop rdx
    mov [rdx+8], r8
    mov [rdx], r9
    
done:
    ret
    