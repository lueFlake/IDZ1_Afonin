	.file	"writeArray.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	writeArray
writeArray:
	# Пролог функции
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	DWORD PTR -20[rbp], edi 	# n = edi
	mov	QWORD PTR -32[rbp], rsi 	# output = rsi
	mov	DWORD PTR -4[rbp], 0 		# i = 0
	jmp	.L2
.L3:

	# Вызов fprintf
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	edx, DWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC0[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT

	add	DWORD PTR -4[rbp], 1 		# ++i
.L2:

	# i < n
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3

	# Эпилог функции 
	leave
	ret
