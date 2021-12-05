; 409262449 吳家萱
.686									
.model flat, stdcall					
.stack 4096	

INCLUDE gcd.inc

.code

main PROC

begin:
	push ebp							
	mov ebp, esp
	sub esp, 8							; 開 8 格存 m 和 n

	call ReadInt
	cmp eax, 0
	jle fin								; 有號數小於等於就跳轉 如果輸入小於 0 就判斷結束
	
	push eax							; 把 n 存進 stack 為了傳給 gcd.asm
	mov DWORD PTR[ebp-4], eax			; 把 n 存進這裡的 stack 為了下面求 lcm 要用

	call ReadInt
	push eax							; 把 m 也存進 stack
	mov DWORD PTR[ebp-8], eax 

	INVOKE gcd							; call gcd.asm

	mov ebx, eax						; 先把 gcd 傳回來的 eax(gcd) 存進沒有在用 ebx 
	call WriteDec
	mov al, ' '							; 輸出空白
	call WriteChar
	
	mov eax, DWORD PTR[ebp-8]
	mul DWORD PTR[ebp-4]				; lcm = m*n / gcd

	cdq
	div ebx
	call WriteDec
	call Crlf	

	jmp begin							; 回來後繼續新的一趟吃輸入

fin:									; 函式結束
	mov esp, ebp						; 最後也要記得清空
	pop ebp
	INVOKE ExitProcess, 0				; 結束

main ENDP

END main
