.text
.global _start
_start:
eor r0, r0
mov r1, #1

sum:
	cmp r1, #10
	addlt r0, r1
	addlt r1, #1
	blt sum

eor r0, r0
mov r7, #1
svc 0
