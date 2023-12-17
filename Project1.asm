comment ?
Summary: Add each array element to its the corresponding data label, 
		 then calculate total =  (num3 + num4) - (num1 + num2) + 1
Lani Do
CMPE 120
Project 1
09/24/2023
?

.386                  
.model flat, stdcall   
.stack 4096  

ExitProcess PROTO, dwExitCode: dword

.DATA
total word ?
num1 word 1
num2 word 2
num3 word 4
num4 word 8
arr word 1000h,2000h,3000h,4000h

.CODE
main proc

	mov esi, offset arr

	mov bx, [esi] 	;add arr[0] to num1
	add num1, bx
	add esi, 2

	mov ax, [esi]  	;add arr[1] to num2
	add num2, ax
	add esi, 2

	mov ax, [esi]  	;add arr[2] to num3
	add num3, ax
	add esi, 2

	mov ax, [esi]  	;add arr[3] to num4
	add num4, ax

	;CALCULATION
	mov ax, num3
	add ax, num4	;ax = num3 + num4
	mov bx, num1
	add bx, num2	;bx = num1 + num2
	mov total, ax	;total = (num3 + num4) 
	sub total, bx	;total = (num3 + num4) - (num1 + num2)
	inc total		;total = (num3 + num4) - (num1 + num2) + 1

	movzx ebx, total ;check result = 400A

	invoke ExitProcess, 0

main endp
end main