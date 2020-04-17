.extern info

.equ HEX, 0
.equ OCT, 1
.equ UNSIGNED, 2
.equ SIGNED, 3

.data
@ Your initialized data
	array:	.word 22, 2, -1 , 5, -7, 34, 88, 111, 13, -27, 15
	array_len: .word 11

.bss
@ Your uninitialized data


.text

.global main
main:

	ldr r0, =array
	ldr r1, =array_len
	ldr r1, [r1]
	bl bubbleSort

	ldr r5, =array
	ldr r6, =array_len
	ldr r6, [r6]
	mov r4, #0

	display2:
	    mov r0, #SIGNED
	    ldr r1, [r5]
	    bl info
	    add r5, #4
	    add r4, #1
	    cmp r4, r6
	    blt display2
	
	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0


@ bubbleSort(array, length)
@ r0 = array
@ r1 = length
.global bubbleSort
bubbleSort:
	push {r4, r5, lr}
	array .req r0
	n     .req r1
	i     .req r2
	lhs   .req r3
	rhs   .req r4
	base  .req r5
	
	while:
	cmp n, #1
	ble end_while
	    sub n, #1

	    eor i, i		@ i := 0
	    mov base, array
	    for:
	    cmp i, n		@ if i > n - 1:
	    bge end_for		@    break
	    
	        ldmia base, {lhs, rhs}
		cmp lhs, rhs
		ble skip		   @ if lhs > rhs: swap
		    str rhs, [base]		
		    str lhs, [base, #4]
		skip:
		add base, #4
		add i, #1
		b for
	    end_for:
	    b while
	end_while:
	
	.unreq array
	.unreq n
	.unreq i
	.unreq lhs
	.unreq rhs
	.unreq base
	pop {r4, r5, pc}

	
