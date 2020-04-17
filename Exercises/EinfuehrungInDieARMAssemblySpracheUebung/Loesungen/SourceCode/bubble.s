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
	@ function call or implementation



	@ DONT DELETE !!!!
	@
	@ You can use the code below to
	@ print the values of the array
	@ in ascending order
	ldr r5, =array
	ldr r6, =array_len
	ldr r6, [r6]
	mov r4, #0

	display:
	    mov r0, #SIGNED
	    ldr r1, [r5]
	    bl info
	    add r5, #4
	    add r4, #1
	    cmp r4, r6
	    blt display
	
	eor r0, r0	@ r0 := 0
	mov r7, #0x1	@ r7 := SYS_exit
	svc 0		@ exit 0


@ bubbleSort(array, length)
@ r0 = array
@ r1 = length
.global bubbleSort
bubbleSort:
	@ you can implement the bubble sort
	@ algorithm here (or directly in main)
	
