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
	@ your code goes here:

	mov r0, #0x8
	add r0, r0, lsl #0x2
	lsr r0, #0x1
	
	mov r1, r0
	mov r0, #HEX
	bl info

	@ and ends here


	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0
