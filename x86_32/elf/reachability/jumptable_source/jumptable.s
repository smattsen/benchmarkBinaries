.global _start
.text
_start:
	cmpl $2, %ebx
	movl $jumps, %eax
	ja exit
	shl $1, %ebx
	addl %ebx, %eax
	jmp *%eax
jumps:
	jmp f0
	jmp f1
	jmp f2
	jmp error

f0:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
f1:
	movl $1,%eax
	movl $1,%ebx
	int $0x80
f2:
	movl $1,%eax
	movl $2,%ebx
	int $0x80
error:
	jmp 0
exit:
	movl $1,%eax
	movl $-1,%ebx
	int $0x80
