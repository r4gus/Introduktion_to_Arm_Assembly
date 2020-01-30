.text
.global _start
_start:
	mov r3, #0xb
	mov r4, #0x16

	push {r3, r4}
	pop  {r4}
	pop  {r3}

	mov r7, #0x1
	mov r0, #0x0
	svc 0
