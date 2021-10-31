.686									; 409262449 吳家萱 10/27 P1
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc
ExitProcess PROTO, dwExitCode: DWORD

.data									
n SDWORD ?								; 變數宣告
space SDWORD ?
b SDWORD ?		
format1 BYTE " ", 0
format2 BYTE "*", 0

.code
main PROC
	
conti:
	call ReadDec						; 用 Dec 讀取
	mov n, eax							; 讀取n
	mov eax, n
	mov space, eax
	cmp n, 0							; 如果 n == 0 結束程式
	je finish
	mov b, 1							; 初始化 b

	mov eax, n							; 要輸出的星星層數
	add eax, n
	mov n, eax
	mov ecx, n
	call printree
	
	jmp conti

finish:
	invoke ExitProcess, 0				; 離開程式
	main ENDP

printree PROC

L1:
	push ecx
	mov eax, space
	sub eax, b
	cmp eax, 0							; 如果 eax < 0 停止迴圈繼續往下
	jbe cont
	mov ecx, eax						
L2:										; 迴圈空白
	mov edx, OFFSET format1
	call WriteString
	loop L2

cont:
	mov eax, b
	add eax, b
	sub eax, 1
	mov ecx, eax
L3:										; 迴圈*
	mov edx, OFFSET format2
	call WriteString
	loop L3

	call Crlf

	pop ecx								; 把 L1 的 ecx 拿出來 - 1
	mov eax, ecx
	sub eax, 1
	mov ecx, eax
	mov eax, b
	add eax, 1
	mov b, eax
	loop L1
	
	ret									; 要記得 ret QQ 不然會超出組建範圍
	printree ENDP

END main