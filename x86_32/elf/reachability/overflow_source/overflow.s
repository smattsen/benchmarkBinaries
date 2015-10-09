.global _start
.text
_start:
	movl $0x7fffffff, %eax
	addl $1, %eax
	cmpl $0x80000000, %eax
	jne error
	movl $0xffffffff, %eax
	addl $1, %eax
	cmpl $0x0, %eax
	jne error
	movl $1, %eax
	int $0x80
error:
	jmp 0
