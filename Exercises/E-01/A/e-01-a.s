@ Exercise: Calculate, r0 := 23 + 12 x 5
@ Author: David Sugar
@ Date: 29.12.2019

.section .data
result: .word 0x0

.section .text
.global _start
_start:

@ ---
@ your code: start
@ ---

eor r0, r0
mov r1, #0xc
add r1, r1, r1, lsl #0x2
add r0, r1, #0x17

@ ---
@ your code: end
@ ---

ldr r1, =result
str r0, [r1]	@ *result := r0
eor r0, r0
mov r7, #0x1
svc 0		@ exit 0
