.extern info

.equ HEX, 0
.equ OCT, 1
.equ UNSIGNED, 2
.equ SIGNED, 3

.data
@ Your initialized data
	i:    .4byte	0xf

.bss
@ Your uninitialized data


.text

.global main
main:
	@ load addr of i using a literal pool
	ldr r4, literal_pool
	
	@ load the value of i
	ldr r5, [r4]
	
	@ print i in hexadecimal to stdout
	mov r0, #HEX
	mov r1, r5
	bl info
	
	@ increment the value of i
	add r5, r5, #1

	@ update i
	str r5, [r4]

	@ print i in hexadecimal to stdout
	mov r0, #HEX
	mov r1, r5
	bl info
	
	@ exit
	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0

literal_pool:
	.word i
