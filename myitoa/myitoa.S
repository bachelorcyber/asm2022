global myitoa
    
section .text
    
myitoa:
    mov rax, 0              ; Set initial total to 0
    push r8
     
convert:
    movzx rsi, byte [rdi]   ; Get the current character
    test rsi, rsi           ; Check for \0
    je done
    
    cmp rsi, 45             ; Anything less than 0 is invalid
    je negative

    cmp rsi, 57             ; Anything greater than 9 is invalid
    jg error
     
    sub rsi, 48             ; Convert from ASCII to decimal 
    imul rax, 10            ; Multiply total by 10
    add rax, rsi            ; Add current digit to total

suite:
    inc rdi                 ; Get the address of the next character
    jmp convert

error:
    mov rax, -1            ; Return -1 on error
 
done:
    cmp r8,-1
    je change_value
done_back:
    pop r8
    ret                     ; Return total or error code

change_value:
    imul rax,r8
    jmp done_back


negative:
    mov r8,-1
    jmp suite

