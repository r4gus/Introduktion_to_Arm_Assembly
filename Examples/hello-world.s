.data
hello: .asciz "Hello World\n"
after:
.set len, after - hello

.text
.global _start
_start:
	mov r7, #0x4		@ write
	mov r0, #0x1		@ stdout
	ldr r1, data_bridge	@ char* str
	mov r2, #len		@ len of str
	svc 0
	
	eor r0, r0	
	mov r7, #0x1
	svc 0			@ exit 0

data_bridge: .word hello
