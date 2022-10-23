	.file	"genInput.c"
	.intel_syntax noprefix
	.text
	.globl	genInput
genInput:
	# Пролог функции
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	# srand(time(0))
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT

	# edx = rand()
	call	rand@PLT
	mov	edx, eax

	movsx	rax, edx	# eax (rax) = edx

	# eax %= 20
	imul	rax, rax, 1717986919
	shr	rax, 32
	sar	eax, 3
	mov	ecx, edx
	sar	ecx, 31
	sub	eax, ecx

	mov	DWORD PTR -8[rbp], eax		# n = eax
	mov	ecx, DWORD PTR -8[rbp]		# ecx = n
	mov	eax, ecx					# eax = ecx = n

	sal	eax, 2
	add	eax, ecx
	sal	eax, 2
	sub	edx, eax					# edx = eax

	mov	DWORD PTR -8[rbp], edx		# n = edx
	mov	DWORD PTR -4[rbp], 0 		# i = 0
	jmp	.L2	# Начало цикла
.L3:
	# Вызов rand()
	call	rand@PLT
	movsx	rdx, eax 				# rdx = rand()

	# rdx %= 100
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]		# rax = i
	cdqe
	lea	rcx, 0[0+rax*4]				# rcx = rax * 4
	lea	rax, A[rip]					# rax = A
	mov	DWORD PTR [rcx+rax], edx	# A[i * 4] = edx (rdx)

	add	DWORD PTR -4[rbp], 1 		# ++i
.L2:

	# i < n
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L3

	mov	eax, DWORD PTR -8[rbp]		# return n

	# Эпилог функции
	leave
	ret
