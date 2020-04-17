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

	mov r4, #100
	mov r5, #38
	mov r6, #0x14

	add r1, r4, r5
	mov r0, #UNSIGNED
	bl info

	sub r1, r4, r5
	mov r0, #UNSIGNED
	bl info
	
	mul r1, r5, r6
	mov r0, #UNSIGNED
	bl info

	@ and ends here


	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0
