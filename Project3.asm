include Irvine32.inc
.DATA
control byte 0
msg1 byte "Medical Laser System",0
msg2 byte "Start? y/n: ",0
msg3 byte "System standby",0
msg4 byte "Standby bit (1/0): ",0
msg5 byte "Ready? y/n: ",0
msg6 byte "Ready bit (1/0): ",0
msg7 byte "Fire? y/n: ",0
msg8 byte "Unable to fire",0
msg9 byte "System fired",0
msg10 byte "System shutdown",0
msg11 byte "Unable to read (y/n)",0
msg12 byte "System ready",0

.CODE
main PROC

mov edx,offset msg1            ;TITLE
call writeString
L1:
	call crlf
	call crlf
	mov edx, offset msg2        ;START?
	call writeString
	call readChar	
	call writeChar
	mov bl, 'y'  
	mov cl, 'n'      
	cmp al,bl            ;check y
	je L2  
	cmp al,cl            ;check n
	je L3
	mov edx, offset msg11       ;invalid input
	call writeString
	jmp L1
L2:
	call crlf
	mov edx, offset msg3        ;STANDBY
	call writeString
	call crlf
	mov edx, offset msg4        ;s.BIT 0/1?
	call writeString
	call readDec
	cmp al,0
	je L2
	;cmp al,1
	call crlf
	mov edx, offset msg5        ;READY?
	call writeString
	call readChar
	call writeChar
	cmp al,bl                   ;check y
	je L4  
	cmp al,cl                   ;check n
	;je ;next step not clear from pic

L4:
	call crlf
	mov edx, offset msg12       ;SYSTEM READY
	call writeString
	call crlf
	mov edx, offset msg6        ;r.BIT 0/1?
	call writeString
	call readDec
L5:
	mov edx, offset msg7        ;FIRE?
	call writeString
	call readChar     
	cmp al,bl            ;check y
	je L6  
	cmp al,cl            ;check n
	je L1
L6:
	call crlf
	mov edx, offset msg9        ;SYSTEM FIRED
	call writeString
L7:
	call crlf
	mov edx, offset msg8        ;UNABLE TO FIRE
	call writeString
	jmp L4

;jmp L1
L3:
mov edx, offset msg10           ;SHUTDOWN
call writeString
exit

main ENDP
end main
