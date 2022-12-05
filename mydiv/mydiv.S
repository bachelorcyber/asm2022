
section .text
global mydiv


mydiv:
    ; rdx = struct adress
    ; rdi = 6
    ; rsi = 3
    cmp rsi,0
    je div_zero
    push rdx
    mov rdx,0
    mov rax,rdi
    mov rbx,rsi    

    div rbx
    mov r8,rax
    mov r9,rdx

    pop rdx
    mov [rdx], r8
    mov [rdx+8], r9 
    jmp end

div_zero:
    mov r8,0
    mov r9,0
    mov [rdx], r8
    mov [rdx+8], r9
    mov rax, 0
    ret

end:
    mov rax, 1
    ret