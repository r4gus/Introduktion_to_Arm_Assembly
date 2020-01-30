.text
.global _start
.global add

_start:
	mov r0, #7
	mov r1, #2
	bl add
	mov r7, #1
	mov r0, #0
	svc 0


add:
	push {r11, lr}	@ prologue
	add r0, r0, r1
	pop {r11, pc}	@ epilogue
