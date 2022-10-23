	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 40000
A:
	.zero	40000
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 40000
B:
	.zero	40000
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%d"
.LC2:
	.string	"w"
.LC3:
	.string	"\ntime in CLOCKS_PER_SEC: %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
	# Пролог функции
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi		# argc = edi
	mov	QWORD PTR -64[rbp], rsi		# argv = rsi

	mov	rax, QWORD PTR -64[rbp]		# rax = argv
	add	rax, 8						# rax += 8 (rax = &argv[1])
	mov	rax, QWORD PTR [rax]		# rax = argv[1]
	movzx	eax, BYTE PTR [rax]		# eax (rax) = argv[1][0]

	cmp	al, 37 						# argv[1][0] == '%'
	jne	.L2						    # если не правда, то идет на LC2

	# Вызов genInput()
	call	genInput@PLT
		
	mov	DWORD PTR -36[rbp], eax		# n = genInput()
	jmp	.L3 						# Чтобы не перейти в else(LC2)

.L2: # else
	mov	rax, QWORD PTR -64[rbp]		# (см. предыдущие комментарии, т. к. вызовы повторяются)
	add	rax, 8						#
	mov	rax, QWORD PTR [rax]		# rax = argv[1]

	lea	rdx, .LC0[rip]				# rdx = "r"
	mov	rsi, rdx					# rsi = rdx = "r"
	mov	rdi, rax					# rdi = rax = argv[1]

	# Вызов fopen(rdi, rsi)
	call	fopen@PLT

	mov	QWORD PTR -8[rbp], rax		# input = fopen(...)
	lea	rdx, -36[rbp]				# rdx = &n
	mov	rax, QWORD PTR -8[rbp]		# rax = input
	lea	rcx, .LC1[rip]				# rcx = "%d"
	mov	rsi, rcx					# rsi = rcx = "%d"
	mov	rdi, rax					# rdi = rax = input

	# Вызов fscanf(rsi, rdi, rdx)
	call	__isoc99_fscanf@PLT

	mov	eax, DWORD PTR -36[rbp]		# eax (rax) = n
	mov	rdx, QWORD PTR -8[rbp]		# rdx = input
	mov	rsi, rdx					# rsi = rdx = input
	mov	edi, eax					# edi (rdi) = eax = n

	# Вызов readArray(rsi, edi)
	call	readArray@PLT

	# Конец else
.L3:
	mov	rax, QWORD PTR -64[rbp]		# (см. предыдущие комментарии, т. к. вызовы повторяются)
	add	rax, 16						#
	mov	rax, QWORD PTR [rax]		# rax = argv[2]

	lea	rdx, .LC2[rip]				# rdx = "w"
	mov	rsi, rdx					# rsi = rdx
	mov	rdi, rax					# rdi = rax

	# Вызов fopen(rdi, rsi)
	call	fopen@PLT

	mov	QWORD PTR -16[rbp], rax		# output = fopen(...)

	# Вызов clock()
	call	clock@PLT

	mov	QWORD PTR -24[rbp], rax		# begin = clock()
	mov	eax, DWORD PTR -36[rbp]		# eax (rax) = n
	mov	edi, eax					# edi (rdi) = eax = n

	# Вызов fill(edi)
	call	fillB@PLT

	# Вызов clock()
	call	clock@PLT

	# Вызов writeArray
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -36[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	writeArray@PLT

	# Вызов fprintf
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT

	mov	eax, 0 # return 0

	# Пролог функции
	leave
	ret
