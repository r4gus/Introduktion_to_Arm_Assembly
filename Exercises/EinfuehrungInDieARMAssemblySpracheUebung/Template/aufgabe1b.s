.extern info

.equ HEX, 0
.equ OCT, 1
.equ UNSIGNED, 2
.equ SIGNED, 3

.data
@ Your initialized data


.bss
@ Your uninitialized data


.text

.global main
main:
	offset .req r0
	n      .req r1
	size   .req r2

	mov size, #10
	mov offset, #0
	mov n, #14	@ n < size * 2

	add offset, n
	cmp offset, size
	subge offset, size

	mov r1, offset
	mov r0, #UNSIGNED
	bl info


	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0
