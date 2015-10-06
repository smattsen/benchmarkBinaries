.global _start
.text
_start:
	cmpl $2, %ebx
	movl $addrs, %eax
	ja exit
	jmp *addrs(,%ebx,4)

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

.data
addrs:
	.long f0
	.long f1
	.long f2
	.long error
