	.file	"readArray.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	readArray
	.type	readArray, @function
readArray:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi		# n = edi
	mov	QWORD PTR -32[rbp], rsi		# input = rsi
	mov	DWORD PTR -4[rbp], 0 		# i = 0
	jmp	.L2 # Начало цикла
.L3:

	# Вызов fscanf
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	add	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC0[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	__isoc99_fscanf@PLT

	add	DWORD PTR -4[rbp], 1 		# ++i
.L2:

	# i < n
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3

	# Эпилог функции
	leave
	ret
