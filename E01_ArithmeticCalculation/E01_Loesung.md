# E01 Lösung
## Aufgabe
Berechnen Sie x = 5 * 7 + 2 ohne dabei einen Multiplikationsbefehl zu verwenden.

## Hintergrund
Multiplikation und Division sind teure Operationen, die i.d.R. viele Tacktzyklen
brauchen um ausgeführt zu werden. Vorallem da diese Operationen für kleinere
Mikroprozessoren meist nicht in Hardware durchgeführt werden können. Aber selbst wenn doch,
bietet es sich an, anstatt einer Multiplikation/ Division, wo möglich, eine Left Shift/
Right Shift Operation durchzuführen.

Ein Left Shift um 1 entspricht dabei einer Multiplikation mit 2. Ein Right Shift
um 1, einer Division durch 2.

Eine Multiplikation/ Division mit einer geraden Zahl ist damit __effektiv in einem
Taktzyklus möglich__.

## Lösungen
### 1)
```
mov r0, #0x7                @ r0 := 7
mov r1, #0x2                @ r1 := 2

add r1, r1, r0              @ r1 := r1 + r0
add r2, r1, r0, lsl #0x2    @ x = r1 + r0*4 = (2+7) + 7*4 = 2 + 7*5
```

### 2)
```
mov r0, #0x7                @ r0 := 7
mov r1, #0x2                @ r1 := 2

add r1, r1, r0
lsl r0, #0x2
add r2, r0, r1
```
