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

	mov r0, #0x11
	bl div_two
	mov r1, r0
	
	mov r0, #HEX
	bl info

	@ and ends here


	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0


@ Divide a given value by two
@
@ int div_two(int x)
@ args:		r0 := x
@ returns:	x / 2
div_two:
	asr r0, #0x1
	blx lr
