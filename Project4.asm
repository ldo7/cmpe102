include Irvine32.inc

displayText MACRO text:REQ, newLine:=<-1>
    LOCAL string
    push edx
    mov  edx, OFFSET text
    call WriteString
    IF newLine EQ -1
        nop
    ELSE
        call crlf
    ENDIF
    pop  edx
ENDM

.DATA
num1 dword 1
num2 dword 2
num3 dword 3
num4 dword 4
num5 dword 5
msg1 byte "System Parameters on Stack",0
msg2 byte "-----------------------------------------",0
msg3 byte "Address: ",0
msg4 byte " => Content: ",0

.CODE
main PROC
    displayText msg1,1
    displayText msg2,1
    push num5
    push num4
    push num3
    push num2
    push num1
    call runLevelOne
    displayText msg2,1
    exit
main ENDP

runLevelOne PROC
    PUSH ebp
    mov ebp, esp
    push num5
    call runLevelTwo
    POP ebp
    RET 20
runLevelOne ENDP

runLevelTwo PROC
    PUSH ebp
    PUSH ecx
    mov ebp,esp
    mov ecx,[ebp+12]
    mov ebx, 24
    L1:
        displayText msg3
        mov eax, ebp
        add eax, ebx
        call writeHex
        mov eax, 'H'
        call writeChar
        displayText msg4
        mov eax, [ebp+ebx]
        call writeHex
        mov eax, 'H'
        call writeChar
        call crlf
        add ebx, TYPE ebx
    loop L1
    POP ecx
    POP ebp 
    RET 4
runLevelTwo ENDP

end main
