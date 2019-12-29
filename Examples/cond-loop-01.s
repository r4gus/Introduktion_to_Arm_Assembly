.section .text
.global _start
_start:
mov r0, #0
mov r1, #1

sum:
	cmp r1, #10
	beq end
	add r0, r0, r1
	add r1, r1, #1
	b sum
end:

	eor r0, r0
	mov r7, #1
	svc 0
