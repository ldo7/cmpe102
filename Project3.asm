include Irvine32.inc

.DATA
    control BYTE 0
    msg1 BYTE "Medical Laser System", 0
    msg2 BYTE "Start? y/n: ", 0
    msg3 BYTE "System standby", 0
    msg4 BYTE "Standby bit (1/0): ", 0
    msg5 BYTE "Ready? y/n: ", 0
    msg6 BYTE "Ready bit (1/0): ", 0
    msg7 BYTE "Fire? y/n: ", 0
    msg8 BYTE "Unable to fire", 0
    msg9 BYTE "System fired", 0
    msg10 BYTE "System shutdown", 0
    msg11 BYTE "Unable to read", 0
    msg12 BYTE "System ready", 0

.CODE
main PROC
    mov edx, OFFSET msg1       ; TITLE
    call writeString
L1:
    call crlf
    call crlf
    mov edx, OFFSET msg2       ; START?
    call writeString
    call readChar
    call writeChar
    call crlf
    mov bl, 'y'
    mov cl, 'n'
    cmp al, bl                 ; Check 'y'
    jz L2
    cmp al, cl                 ; Check 'n'
    jz L3
    mov edx, OFFSET msg11      ; Invalid input
    call writeString
    jmp L1
L2:
    mov edx, OFFSET msg3       ; STANDBY
    call writeString
    call crlf
    mov edx, OFFSET msg4       ; s.BIT 0/1?
    call writeString
    call readDec
    cmp al,0
	jz L2
    shl al, 7                  ; Set MSB
    or control, al
L4:
    mov edx, OFFSET msg5       ; READY?
    call writeString
    call readChar
    call writeChar
    cmp al, bl                 ; Check 'y'
    jz L5
    cmp al, cl                 ; Check 'n'
    call crlf 
    jz L4
L5:
    call crlf
    mov edx, OFFSET msg12      ; SYSTEM READY
    call writeString
    call crlf
    mov edx, OFFSET msg6       ; r.BIT 0/1?
    call writeString
    call readDec
    cmp al,0
    jz L5
    rcl control, 1             ; Set LSB
L6:
    mov edx, OFFSET msg7       ; FIRE?
    call writeString
    call readChar
    call writeChar
    cmp al, bl                 ; Check 'y'
    ;check ready bit 


    jz L7
    cmp al, cl                 ; Check 'n'
    jmp L1
L7:
    call crlf
    mov edx, OFFSET msg9       ; SYSTEM FIRED
    call writeString
    call crlf
    jmp L6

L3:
    mov edx, OFFSET msg10      ; SHUTDOWN
    call writeString

exit
main ENDP
END main


Medical Laser System

Start? y/n: y
System standby
Standby bit (1/0): 1
Ready? y/n: y
System ready
Ready bit (1/0): 1
Fire? y/n: n

Start? y/n: y
System standby
Standby bit (1/0): 0
Ready? y/n: y
System standby
System bit (1/0): 1
Ready? y/n: y
System ready
Ready bit (1/0): 0
Fire? y/n: y
Unable to fire
System ready
Ready bit (1/0): 1
Fire? y/n: n

Start? y/n: y
System standby
Standby bit (1/0): 1
Ready? y/n: y
System ready
Ready bit (1/0): 1
Fire? y/n: y
System fired
Fire? y/n: n

Start? y/n: n
System shutdown


