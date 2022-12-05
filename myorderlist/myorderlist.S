global   orderlist

section   .data
.comma   db   44,32
.backline   db   0x0a
.reverse:   resb   100

section   .text

orderlist:
	push   rbp
	push   rbx
	push   r13
	push   r12
	sub   rsp,   8
	mov   r8,   rsi
	mov   r12,   rdi
	mov   rax,   0
	.sort:
	cmp   rax,   r8
	je   .prochain
	mov   rdx,   rax
	add   rdx,   1
	.soustri:
	cmp   rdx,   r8
	je   .sousprochain
	mov   r14,   [r12+8*rdx]
	mov   r15,   [r12+8*rax]
	cmp   r14,   r15
	jae   .aft
	mov   [r12+8*rdx],   r15
	mov   [r12+8*rax],   r14
	.aft:
	add   rdx,   1
	jmp   .soustri
	.sousprochain:
	add   rax,   1
	jmp   .sort
	.prochain:
	mov   r9,   0
	mov   r13,   10
	lea   r10,   [rel .reverse]
	.writeLoop:
	mov   rax,   [r12+8*r9]
	mov   r14,   100
	mov   r15,   rax
	.syscall_write_loop:
	mov   rdx,   0
	div   r13
	add   dl,   48
	mov   [r10+r14],   dl
	dec   r14
	cmp   rax,   0
	jne   .syscall_write_loop
	mov   rax,   1
	lea   rsi,   [r14+r10+1]
	mov   rdx,   100
	sub   rdx,   r14
	mov   rdi,   1
	syscall   
	add   r9,   1
	cmp   r9,   r8
	je   .end
	mov   rax,   1
	mov   rdx,   2
	lea   rsi,   [rel .comma]
	mov   rdi,   1
	syscall
	jmp   .writeLoop
	.end:
	mov   rdx,   1
	mov   rax,   1
	lea   rsi,   [rel .backline]
	mov   rdi,   1
	syscall
	add   rsp,   8
	pop   rbx
	pop   r12
	pop   rbp
	pop   r13

	ret
