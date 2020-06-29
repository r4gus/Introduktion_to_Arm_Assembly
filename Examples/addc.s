.section .data
x1: .word 0xffffffff
x2: .word 0x00000023 
y1: .word 0xff000000
y2: .word 0x00000100

.section .text
.global _start

_start:
	adr r8, numbers
	
	@ load addresses
	ldm r8, {r0, r1, r2, r3}

	@ acquire actual values
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]

	adds r0, r2
	adc r1, r3

	bkpt

numbers:	.word x1
		.word x2
		.word y1
		.word y2
