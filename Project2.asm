include Irvine32.inc

.DATA
msg1 byte "--- Array Copier ---",0
msg2 byte "Index (0-4): ",0
msg3 byte "Invalid Input. Try again",0
msg4 byte "Continue? y/n: ",0
msg5 byte "--- Program Terminated ---",0
arr2 byte 0,0,0,0,0 
arr1 byte 1,2,3,4,5  ;test array
;arr2 $-arr1/type byte DUP 0
startIndex byte ?

.CODE
main PROC
	
	call displayTitle

	L1:
		call crlf
		mov edx, offset msg2
		call writeString
		call readInt	     ;REQUEST INPUT
		mov startIndex, al
		cmp startIndex,0	 ;VALIDATE INPUT
		jl L3
		cmp startIndex,4
		jg L3
		call copyArray       ;COPY
		call showArray       ;DISPLAY
	L2:
		mov edx, offset msg4 ;CONTINUE?
		call writeString
		call readChar
		mov bl, 'y'        
		cmp al,bl     
		je L1
		mov cl, 'n'
		cmp al,cl
		jne L4
		je L5
	L3:                      ;INVALID - NOT WITHIN [0,4]
		mov edx, offset msg3
		call writeString
		jmp L1
	L4:
		call crlf            ;INVALID - NOT Y/N
		mov edx, offset msg3
		call writeString
		call crlf
		jmp L2
	L5:
		call endProgram
		exit
main ENDP

;===================================
;Prints this project title
displayTitle PROC
	mov edx, offset msg1
	call writeString
	ret
displayTitle ENDP

;===================================
;Copies elements from one array to another  
copyArray PROC
	mov ecx, lengthof arr1
    mov ebx, offset arr1
    mov esi, offset arr2
    add bl, startIndex
    L2:
        mov al, [ebx]
        mov [esi], al
        inc esi
        inc ebx
    loop L2
    ret
copyArray ENDP	

;===================================
;Displays array contents on console
showArray PROC
	mov ecx, 5
	mov esi, offset arr2
	L2:
		movzx eax, byte ptr [esi] 
		call WriteHex
		inc esi 
		call crlf
	loop L2
	ret
showArray ENDP	

;===================================
;Print the termination message
endProgram PROC
	call crlf
	mov edx, offset msg5
	call writeString
	ret
endProgram ENDP

end main