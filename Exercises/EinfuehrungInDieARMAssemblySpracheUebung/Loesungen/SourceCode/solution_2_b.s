.extern info

.equ HEX, 0
.equ OCT, 1
.equ UNSIGNED, 2
.equ SIGNED, 3

.data
@ Your initialized data


.bss
@ Your uninitialized data
.align 8
buffer: .space 16
after:
.set len, after - buffer


.text

.global main
main:
	@ your code goes here:

	offset .req r0
	n .req r1
	buffer_size .req r2
	i .req r3
	buffer_addr .req r4
	

	eor offset, offset
	mov n, #0x4
	mov buffer_size, #len
	mov i, #0xB
	ldr buffer_addr, =buffer

	loop:
		str i, [buffer_addr, offset] 	@ buffer_addr[offset] := i
		add i, #0xB			@ i += 11

		add offset, n
		cmp offset, buffer_size
		subge offset, buffer_size

		cmp i, #0x42			@ if i < 66: branch loop
		blt loop
	
	mov r0, #HEX
	ldr r1, [buffer_addr]
	bl info

	mov r0, #HEX
	ldr r1, [buffer_addr, #0x4]
	bl info

	mov r0, #HEX
	ldr r1, [buffer_addr, #0x8]
	bl info

	mov r0, #HEX
	ldr r1, [buffer_addr, #0xC]
	bl info

	.unreq offset
	.unreq n
	.unreq buffer_size
	.unreq buffer_addr
	
	@ and ends here
	

	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0
