.section .data
result: .word 0x0

.section .text
.global _start
_start:

@ ---
@ your code: start
@ ---




@ ---
@ your code: end
@ ---

ldr r1, =result
str r0, [r1]	@ *result := r0
eor r0, r0
mov r7, #0x1
svc 0		@ exit 0
