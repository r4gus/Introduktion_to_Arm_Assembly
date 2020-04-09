.extern info

.equ HEX, 0
.equ OCT, 1
.equ UNSIGNED, 2
.equ SIGNED, 3

.data
@ Your initialized data
	array:	.word 2
		.word 3
		.word 5

.bss
@ Your uninitialized data


.text

.global main
main:
	@ load address of array
	ldr r0, literal
	
	@ load all three values in a row
	@ r1 := *(ro + 0)
	@ r2 := *(r0 + 4)
	@ r3 := *(r0 + 8)
	ldmia r0, {r1, r2, r3}

	@ sum up all values
	add r1, r1, r2
	add r1, r1, r3
	
	@ out
	mov r0, #HEX
	bl info

	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0

literal:	.word array
