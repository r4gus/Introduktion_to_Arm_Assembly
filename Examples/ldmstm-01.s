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

	ldm r2, {r3-r5}
	stm r0, {r3-r5}

	mov r7, #1
	mov r0, #0
	svc 0

	num:	.word 1
		.word 2
		.word 3
		.word 4
		.word 5
