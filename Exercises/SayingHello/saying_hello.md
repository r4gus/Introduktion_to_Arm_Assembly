# Saying Hello to ARM
## Schwierigkeit: Leicht

Das "Hello, World!" Programm ist in der Regel das erste Programm,
das ein Programmierer schreibt, wenn er sich an eine neue Programmiersprache
wagt. Wir wollen diese Tradition fortführen, wobei diese Aufgabe nicht für
den Einstieg geeignet ist. Es werden einige Konzepte wie Systemcalls und
Subroutinenaufrufe vorrausgesetzt, um diese Aufgabe lösen zu können.

Erstellen Sie ein ARM Assembler-Programm, dass "Hello, ARM!" auf der Kommandozeile ausgibt und
sich danach ordnungsgemäß, d.h. mit Rückgabewert 0, beendet.

### Beispielausgabe
```
Hello, ARM!
```

### Einschränkungen
Nutzen Sie nicht den __ldr <Rd>, =imm__ Pseudobefehl
