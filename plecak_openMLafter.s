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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	call	omp_get_num_threads
	movl	%eax, %edi
	call	omp_get_thread_num
	movl	%eax, %ebx
	movl	24(%rsi), %eax
	cltd
	idivl	%edi
	cmpl	%edx, %ebx
	jl	.L2
.L7:
	imull	%eax, %ebx
	addl	%edx, %ebx
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	jge	.L1
	movslq	28(%rsi), %rdx
	movq	16(%rsi), %rcx
	addl	$1, %ebx
	leal	1(%rax), %edi
	movq	(%rsi), %r14
	leaq	-4(,%rdx,4), %r15
	movq	-8(%rcx,%rdx,8), %r12
	movq	(%rcx,%rdx,8), %r13
	addq	%r15, %r14
	addq	8(%rsi), %r15
	movslq	%ebx, %rsi
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%r14), %edx
	movl	(%r12,%rsi), %eax
	leaq	0(%r13,%rsi), %rbp
	cmpl	%edx, %ebx
	jl	.L6
	movl	%ebx, %ecx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	subl	%edx, %ecx
	movl	(%r15), %edx
	cvtsi2sdl	%eax, %xmm1
	movslq	%ecx, %rcx
	addl	(%r12,%rcx,4), %edx
	cvtsi2sdl	%edx, %xmm0
	call	fmax
	cvttsd2sil	%xmm0, %eax
.L6:
	addl	$1, %ebx
	movl	%eax, 0(%rbp)
	addq	$4, %rsi
	cmpl	%edi, %ebx
	jne	.L5
.L1:
	addq	$40, %rsp
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
	jmp	.L7
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
	movslq	%ecx, %rdi
	movq	%rdx, %rbp
	movq	%r8, %r12
	cltq
	movl	%r9d, %esi
	salq	$3, %rax
	movq	%rax, %rcx
	movq	%rax, 56(%rsp)
	call	malloc
	movq	%rax, %rbx
	testl	%esi, %esi
	js	.L11
	leal	1(%rdi), %r13d
	movq	%rbx, %r14
	movslq	%r13d, %r13
	leaq	0(,%r13,4), %rax
	movq	%rbx, %r13
	movq	%rax, 40(%rsp)
	movslq	%esi, %rax
	movq	%rax, 48(%rsp)
	leaq	8(%rbx,%rax,8), %r15
	.p2align 4,,10
	.p2align 3
.L12:
	movq	40(%rsp), %rcx
	addq	$8, %r14
	call	malloc
	movq	%rax, -8(%r14)
	cmpq	%r15, %r14
	jne	.L12
	.p2align 4,,10
	.p2align 3
.L13:
	movq	0(%r13), %rax
	addq	$8, %r13
	movl	$0, (%rax)
	cmpq	%r15, %r13
	jne	.L13
	testl	%edi, %edi
	js	.L14
.L20:
	movslq	%edi, %rax
	movq	(%rbx), %rcx
	xorl	%edx, %edx
	leaq	4(,%rax,4), %r8
	movq	%rax, 40(%rsp)
	call	memset
	testl	%esi, %esi
	jle	.L15
	movslq	%esi, %rax
	movq	%rax, 48(%rsp)
.L21:
	movl	$1, %r15d
	leaq	64(%rsp), %r14
	leaq	dynamic._omp_fn.0(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L16:
	movq	%r14, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%r13, %rcx
	movl	%r15d, 92(%rsp)
	movq	%rbx, 80(%rsp)
	movq	%r12, 72(%rsp)
	movq	%rbp, 64(%rsp)
	movl	%edi, 88(%rsp)
	call	GOMP_parallel
	movl	%r15d, %edx
	addl	$1, %r15d
	cmpl	%edx, %esi
	jne	.L16
	movq	56(%rsp), %rax
	movq	40(%rsp), %rdi
	movq	-8(%rbx,%rax), %rax
	movl	(%rax,%rdi,4), %ebp
.L17:
	movq	48(%rsp), %rax
	movq	%rbx, %rsi
	leaq	8(%rbx,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L19:
	movq	(%rsi), %rcx
	addq	$8, %rsi
	call	free
	cmpq	%rsi, %rdi
	jne	.L19
.L18:
	movq	%rbx, %rcx
	call	free
	movl	%ebp, %eax
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
.L11:
	testl	%edi, %edi
	jns	.L20
	movq	56(%rsp), %rax
	movq	-8(%rbx,%rax), %rax
	movl	(%rax,%rdi,4), %ebp
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	%edi, %rax
	movq	%rax, 40(%rsp)
	testl	%esi, %esi
	jne	.L21
	movq	(%rbx), %rax
	movq	40(%rsp), %rdi
	movl	(%rax,%rdi,4), %ebp
	jmp	.L17
.L15:
	movq	56(%rsp), %rax
	movq	40(%rsp), %rdi
	movq	-8(%rbx,%rax), %rax
	movl	(%rax,%rdi,4), %ebp
	jne	.L18
	movq	$0, 48(%rsp)
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
	jle	.L37
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L32:
	movslq	%ebx, %r11
	addq	$4, %rax
	addl	$1, %ebx
	movl	%ecx, (%r12,%r11,4)
	movl	%edx, (%rdi,%r11,4)
	cmpq	%rax, %rbp
	je	.L39
.L34:
	cmpl	$1, (%r15,%rax)
	movl	(%rsi,%rax), %ecx
	movl	(%r14,%rax), %edx
	jne	.L32
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
	jne	.L34
.L39:
	movl	60(%rsp), %r10d
.L31:
	movl	56(%rsp), %r15d
	movl	%r8d, 60(%rsp)
	cmpl	%r8d, %r15d
	jl	.L35
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
.L36:
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
.L35:
	leaq	.LC1(%rip), %rcx
	movl	%r10d, 60(%rsp)
	call	puts
	movl	60(%rsp), %r9d
	movq	%rsi, %rdx
	movq	%r14, %r8
	movl	56(%rsp), %ecx
	call	dynamic
	movl	%eax, %edx
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L37:
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%r8d, %r8d
	jmp	.L31
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
	jle	.L42
	movl	%r14d, %ebx
	xorl	%r15d, %r15d
	shrl	$31, %ebx
	addl	%r14d, %ebx
	sarl	%ebx
	.p2align 4,,10
	.p2align 3
.L43:
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
	jne	.L43
.L42:
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
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	GOMP_parallel;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	omp_get_wtime;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
