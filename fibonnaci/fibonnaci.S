section .text
global fibonnaci

fibonnaci:
        push r8 ; first
        push r9 ; second
        push r10 ; tmp
        mov r8, 0;  first
        mov r9, 1; second
        mov r10, 0 ; tmp
        cmp rdi, 0
        jl ret_neg
fibo:        
        cmp rdi, 0
        jle normal_ret
        add r10,r8
        add r10,r9
        mov r8,r9
        mov r9,r10
        dec rdi
        mov r10,0
        jmp fibo

ret_neg:
        mov rax,-1
        jmp done

normal_ret:
        mov rax,r8
        jmp done

done:
        ;mov rax, r8
        pop r9
        pop r8
        pop r10
        ret