@ EN: Calculate x = 5 * 7 + 2 without using a multiplication command.
@ DE: Berechnen Sie x = 5 * 7 + 2 ohne dabei einen Multiplikationsbefehl zu verwenden.

.section .text
.global _start

_start:
    @ Multiplication is a very 'expensive' operation, 
    @ which means that it costs a lot of processing time. 
    @ Therefore multiplications should be avoided if possible.
    @--------------------------------------------------
    @ Multiplikationen brauchen viel Rechenzeit um
    @ durchgeführt zu werden. Deshalb sollten sie wenn
    @ möglich vermieden werden.
    
    mov r0, #0x7                @ r0 := 7
    mov r1, #0x2                @ r1 := 2

    add r1, r1, r0              @ r1 := r1 + r0
    add r2, r1, r0, lsl #2      @ x = r1 + r0*4 = (2+7) + 7*4 = 2 + 7*5



@ Don't think about this code for now
@ Fürs erste ignorieren
mov r7, #0x1      @ exit (syscall number)
mov r0, #0x0      @ exit success
svc #0x0          @ supervisor call (systemcall)


    
