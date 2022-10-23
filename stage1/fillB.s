	.file	"fillB.c"
	.intel_syntax noprefix
	.text
	.globl	fillB
	.type	fillB, @function
fillB:
	# Пролог функции
	push	rbp
	mov	rbp, rsp

	mov	DWORD PTR -20[rbp], edi 	# n = edi
	mov	DWORD PTR -4[rbp], 0 		# i = 0
	jmp	.L2
.L3:

	# Получение нового A[i * 4] (т к int - 4 байта) в edx
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	edx, DWORD PTR [rdx+rax]

	# Получение нового A[i * 4] в eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rcx+rax]

	# eax = A[i * 4] * A[i * 4]
	imul	eax, edx


	# B[i * 4] = eax
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, B[rip]
	mov	DWORD PTR [rcx+rdx], eax

	add	DWORD PTR -4[rbp], 1 		# ++i
.L2:

	# i < n
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3

	# Эпилог функции 
	pop	rbp
	ret
