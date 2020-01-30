# ARM Aufgabenblatt 1
## Einleitung
Die folgenden Aufgaben und dazugehörigen Lösungen sind für __Raspberry Pi 3__ Modelle konzipiert, 
sollten aber in den meisten Fällen auch unter abweichenden Modellen funktionieren. Außerdem werden
für die Aufgaben die 32-Bit und 16-Bit (Thumb) Instruction Sets verwendet.

Der Quellcode wird in Dateien mit der Endung __.s__ geschrieben und mit folgenden Befehlen auf der Kommandozeile in
eine ausführbare Datei umgewandelt.
```
as <file>.s -o <file>.o
ld <file>.o -o <file>
```

Danach kann das Programm mittels __gdb__ inspiziert werden. Es wird eine Erweiterung wie z.B. [gef](https://github.com/hugsy/gef) für gdb empfohlen.
```
gdb <file>
```

Eine Übersicht aller Systemcalls, incl. benötigter Argumente findet sich [hier](https://w3challs.com/syscalls/?arch=arm_strong).

## Aufgaben
### 1) Rechnen
Nutzen Sie für die Folgenden Aufgaben die Vorlage __calculate.s__ benennen Sie diese ggf. um.

#### a)
Berechnen Sie __32 + 12 x 5__ ohne einen Multiplikationsbefehl zu verwenden und schreiben sie das Ergebnis nach __r0__.

