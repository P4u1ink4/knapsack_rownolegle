	.file	"plecak_openML.c"
	.text
	.p2align 4
	.def	dynamic._omp_fn.0;	.scl	3;	.type	32;	.endef
	.seh_proc	dynamic._omp_fn.0
dynamic._omp_fn.0:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rsi
	call	omp_get_num_threads
	movl	%eax, %ebx
	call	omp_get_thread_num
	movl	%eax, %ecx
	movl	24(%rsi), %eax
	addl	$1, %eax
	cltd
	idivl	%ebx
	cmpl	%edx, %ecx
	jl	.L2
.L8:
	imull	%eax, %ecx
	leal	(%rcx,%rdx), %ebx
	leal	(%rax,%rbx), %edi
	cmpl	%edi, %ebx
	jge	.L1
	movslq	28(%rsi), %rax
	movq	(%rsi), %r15
	movq	16(%rsi), %rdx
	leaq	-4(,%rax,4), %r9
	addq	%r9, %r15
	addq	8(%rsi), %r9
	testl	%eax, %eax
	movslq	%ebx, %rsi
	sete	%r13b
	movq	(%rdx,%rax,8), %r12
	leaq	-8(%rdx,%rax,8), %r14
	salq	$2, %rsi
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	movq	(%r14), %rdx
	movl	(%r15), %ecx
	movl	(%rdx,%rsi), %eax
	cmpl	%ecx, %ebx
	jl	.L7
	movl	%ebx, %r8d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	%r9, 40(%rsp)
	subl	%ecx, %r8d
	movl	(%r9), %ecx
	cvtsi2sdl	%eax, %xmm1
	movslq	%r8d, %r8
	addl	(%rdx,%r8,4), %ecx
	cvtsi2sdl	%ecx, %xmm0
	call	fmax
	movq	40(%rsp), %r9
	cvttsd2sil	%xmm0, %eax
.L7:
	addl	$1, %ebx
	movl	%eax, 0(%rbp)
	addq	$4, %rsi
	cmpl	%ebx, %edi
	je	.L1
.L6:
	leaq	(%r12,%rsi), %rbp
	testl	%ebx, %ebx
	je	.L9
	testb	%r13b, %r13b
	je	.L4
.L9:
	xorl	%eax, %eax
	addl	$1, %ebx
	addq	$4, %rsi
	movl	%eax, 0(%rbp)
	cmpl	%ebx, %edi
	jne	.L6
.L1:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L8
	.seh_endproc
	.p2align 4
	.globl	dynamic
	.def	dynamic;	.scl	2;	.type	32;	.endef
	.seh_proc	dynamic
dynamic:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	leal	1(%r9), %eax
	movl	%ecx, %ebp
	movq	%r8, %r13
	movl	%r9d, %edi
	cltq
	movq	%rdx, 184(%rsp)
	salq	$3, %rax
	movq	%rax, %rcx
	movq	%rax, 40(%rsp)
	call	malloc
	movq	%rax, %rsi
	movslq	%ebp, %rax
	movq	%rax, 48(%rsp)
	leaq	0(,%rax,4), %r14
	testl	%edi, %edi
	js	.L13
	movslq	%edi, %rdx
	addq	$4, %r14
	movq	%rsi, %r12
	movq	%rsi, %r15
	leaq	8(%rsi,%rdx,8), %rbx
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%r14, %rcx
	addq	$8, %r15
	call	malloc
	movq	%rax, -8(%r15)
	cmpq	%rbx, %r15
	jne	.L14
	xorl	%r14d, %r14d
	movq	%rbx, 56(%rsp)
	leaq	64(%rsp), %r15
	movl	%r14d, %ebx
	movl	%edi, %r14d
	movq	184(%rsp), %rdi
	.p2align 4,,10
	.p2align 3
.L15:
	movq	%r15, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	%ebx, 92(%rsp)
	leaq	dynamic._omp_fn.0(%rip), %rcx
	movq	%rsi, 80(%rsp)
	movq	%r13, 72(%rsp)
	movq	%rdi, 64(%rsp)
	movl	%ebp, 88(%rsp)
	call	GOMP_parallel
	movl	%ebx, %edx
	addl	$1, %ebx
	cmpl	%edx, %r14d
	jne	.L15
	movq	40(%rsp), %rax
	movq	56(%rsp), %rbx
	movq	-8(%rsi,%rax), %rdx
	movq	48(%rsp), %rax
	movl	(%rdx,%rax,4), %edi
	.p2align 4,,10
	.p2align 3
.L16:
	movq	(%r12), %rcx
	addq	$8, %r12
	call	free
	cmpq	%rbx, %r12
	jne	.L16
.L17:
	movq	%rsi, %rcx
	call	free
	movl	%edi, %eax
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	movq	40(%rsp), %rax
	movq	48(%rsp), %rdi
	movq	-8(%rsi,%rax), %rax
	movl	(%rax,%rdi,4), %edi
	jmp	.L17
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Przedmioty konieczne w plecaku\0"
	.align 8
.LC1:
	.ascii "Nie udalo zmiescic sie wszystkich koniecznych przedmiotow w plecaku.\0"
	.align 8
.LC2:
	.ascii "Wynik algorytmu dynamicznego: %d\12\0"
	.text
	.p2align 4
	.globl	separator
	.def	separator;	.scl	2;	.type	32;	.endef
	.seh_proc	separator
separator:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	176(%rsp), %r15
	movslq	%ecx, %rcx
	movl	%edx, 56(%rsp)
	movq	%r8, %rsi
	movq	%r9, %r14
	leaq	0(,%rcx,4), %rbp
	movl	%ecx, 60(%rsp)
	movq	%rbp, %rcx
	call	malloc
	movq	%rbp, %rcx
	movq	%rax, 40(%rsp)
	call	malloc
	movq	%rbp, %rcx
	movq	%rax, 48(%rsp)
	call	malloc
	movq	%rbp, %rcx
	movq	%rax, %r12
	call	malloc
	movl	60(%rsp), %r10d
	movq	%rax, %rdi
	testl	%r10d, %r10d
	jle	.L29
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L24:
	movslq	%ebx, %r11
	addq	$4, %rax
	addl	$1, %ebx
	movl	%ecx, (%r12,%r11,4)
	movl	%edx, (%rdi,%r11,4)
	cmpq	%rax, %rbp
	je	.L31
.L26:
	cmpl	$1, (%r15,%rax)
	movl	(%rsi,%rax), %ecx
	movl	(%r14,%rax), %edx
	jne	.L24
	movq	40(%rsp), %r10
	movslq	%r9d, %r11
	addq	$4, %rax
	addl	$1, %r9d
	addl	%ecx, %r8d
	addl	%edx, %r13d
	movl	%ecx, (%r10,%r11,4)
	movq	48(%rsp), %r10
	movl	%edx, (%r10,%r11,4)
	cmpq	%rax, %rbp
	jne	.L26
.L31:
	movl	60(%rsp), %r10d
.L23:
	movl	56(%rsp), %r15d
	movl	%r8d, 60(%rsp)
	cmpl	%r8d, %r15d
	jl	.L27
	leaq	.LC0(%rip), %rcx
	call	puts
	movl	60(%rsp), %r8d
	movl	%r15d, %ecx
	movq	%r12, %rdx
	movl	%ebx, %r9d
	subl	%r8d, %ecx
	movq	%rdi, %r8
	call	dynamic
	leal	(%rax,%r13), %edx
.L28:
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	40(%rsp), %rcx
	call	free
	movq	48(%rsp), %rcx
	call	free
	movq	%r12, %rcx
	call	free
	movq	%rdi, %rcx
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	free
	.p2align 4,,10
	.p2align 3
.L27:
	leaq	.LC1(%rip), %rcx
	movl	%r10d, 60(%rsp)
	call	puts
	movl	60(%rsp), %r9d
	movq	%rsi, %rdx
	movq	%r14, %r8
	movl	56(%rsp), %ecx
	call	dynamic
	movl	%eax, %edx
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L29:
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%r8d, %r8d
	jmp	.L23
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Czas wykonania: %f s\12\0"
	.text
	.p2align 4
	.globl	generator
	.def	generator;	.scl	2;	.type	32;	.endef
	.seh_proc	generator
generator:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	movups	%xmm6, 48(%rsp)
	.seh_savexmm	%xmm6, 48
	.seh_endprologue
	movq	144(%rsp), %r12
	movl	%ecx, %ebx
	movl	%edx, %esi
	movq	%r8, %rdi
	movq	%r9, %rbp
	call	omp_get_wtime
	movq	%r12, 32(%rsp)
	movl	%esi, %edx
	movl	%ebx, %ecx
	movq	%rbp, %r9
	movq	%rdi, %r8
	movapd	%xmm0, %xmm6
	call	separator
	call	omp_get_wtime
	leaq	.LC3(%rip), %rcx
	movapd	%xmm0, %xmm1
	subsd	%xmm6, %xmm1
	movups	48(%rsp), %xmm6
	movq	%xmm1, %rdx
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	printf
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rdx, %rbx
	call	__main
	movq	8(%rbx), %rcx
	call	atoi
	movq	16(%rbx), %rcx
	movslq	%eax, %rsi
	call	atoi
	movq	%rsi, %r13
	salq	$2, %rsi
	movq	%rsi, %rcx
	movl	%eax, %r14d
	call	malloc
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	malloc
	movq	%rsi, %rcx
	movq	%rax, %rbp
	call	malloc
	movq	%rax, %r12
	testl	%r13d, %r13d
	jle	.L34
	movl	%r14d, %ebx
	xorl	%r15d, %r15d
	shrl	$31, %ebx
	addl	%r14d, %ebx
	sarl	%ebx
	.p2align 4,,10
	.p2align 3
.L35:
	call	rand
	cltd
	idivl	%ebx
	addl	$1, %edx
	movl	%edx, (%rdi,%r15)
	call	rand
	movl	$0, (%r12,%r15)
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1717986919, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$34, %rdx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %edx
	addl	%edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	movl	%eax, 0(%rbp,%r15)
	addq	$4, %r15
	cmpq	%r15, %rsi
	jne	.L35
.L34:
	movq	%r12, 32(%rsp)
	movq	%rbp, %r9
	movq	%rdi, %r8
	movl	%r14d, %edx
	movl	%r13d, %ecx
	call	generator
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 13.2.0"
	.def	omp_get_num_threads;	.scl	2;	.type	32;	.endef
	.def	omp_get_thread_num;	.scl	2;	.type	32;	.endef
	.def	fmax;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	GOMP_parallel;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	omp_get_wtime;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
