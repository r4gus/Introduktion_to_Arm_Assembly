;EN: Calculate x = 5 * 7 + 2 without using a multiplication command.
;DE: Berechnen Sie x = 5 * 7 + 2 ohne dabei einen Multiplikationsbefehl zu verwenden.

.section .text
.global _start

_start:
    ; here begins your code
    ; Instruktionen hier einfügen



; Don't think about this code for now
; Fürs erste ignorieren
mov r7, #1      ; exit (syscall number)
mov r0, #0      ; exit success
svc #0          ; supervisor call (systemcall)


    
