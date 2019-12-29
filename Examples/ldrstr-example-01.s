.section .data
i: .word 0xf

.section .text
.global _start
_start:

ldr r1, adr_i

ldr r0, [r1]
add r0, r0, #1
str r0, [r1]

eor r0, r0
mov r7, #1
svc 0

adr_i: .word i
