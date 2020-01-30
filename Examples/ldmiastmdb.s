.data
	array: 	.word 0
		.word 0
		.word 0

.text
.global _start
_start:
	ldr r0, =array
	ldr r1, =array+8
	adr r2, num+8
	
	mov r3, #11
	mov r4, #33
	str r4, [r1]
	mov r4, #22
	

	stmdb r1!, {r3-r4}
	eor r3, r3
	eor r4, r4
	ldmia r1!, {r3-r4}

	mov r7, #1
	mov r0, #0
	svc 0

	num:	.word 1
		.word 2
		.word 3
		.word 4
		.word 5
