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
	
	mov r0, #8
	mov r1, r0	@ r1 := r0	|  r1 := 8

	@lsl r1, #0x2	@ r1 := r1 * 4  |  r1 := 8 * 4
	@add r1, r0	@ r1 := r1 + r0 |  r1 := 32 + 8

	add r1, r1, lsl, #2
	lsr r1, #1	@ r1 := r1 / 2	|  r1 := 40 / 2 = 20

	mov r0, #UNSIGNED
	bl info



	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0
