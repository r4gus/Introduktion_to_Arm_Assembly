.data
hello: .asciz "Hello, World!\n"
after: .set len, after - hello

.text
.global _start
_start:
	mov r7, #4
	mov r0, #1
	ldr r1, =hello
	mov r2, #len
	svc 13

	mov r0, #12
	mov r7, #1
	svc 0
