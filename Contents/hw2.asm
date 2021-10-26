.686									; 指定微處理器模式
.model flat, stdcall					; model -> 定義記憶體模式, stdcall -> windows API 的標準呼叫約定
.stack 4096								; 堆疊 -> 用來保存傳遞的參數 & 保存調用函數的程式位址

INCLUDE Irvine32.inc
ExitProcess PROTO, dwExitCode: DWORD	; windos 服務, 原型包含函數名, PROTO 關鍵字, 輸入參數列表

.data									; 組譯時配置
arr SDWORD 200 DUP(0)					; 陣列宣告 SDWORD
n SDWORD ?								; 變數宣告
small SDWORD ?
large SDWORD ?				
format1 BYTE "Min = ", 0				; 輸出字串宣告
format2 BYTE "Max = ", 0

.code

main PROC
	call ReadInt						; Irvine32.lib 內建函式之一 可用來讀取 Int
	mov esi, OFFSET arr					; 把 arr 的位址放進 esi 暫存器
	mov n, eax							; ReadInt 讀取的輸入會先暫存在 eax 中 所以要 mov 進 n 裡
	mov ecx, n							; 迴圈寫法, ecx 是 計數器, 原理: ecx != 0 繼續跑 -> 總共跑 n 次

L1:										; 這邊在做讀取 input 的單層 for 迴圈的工作 
	call ReadInt
	mov [esi], eax						; 把 eax 讀取輸入的值放入 arr, esi 指向陣列位址的頭
	add esi, TYPE arr					; 往上指下一位 ( TYPE arry 大小 ) 的 esi 
	loop L1								; 迴圈循環

	sub n, 1							; n - 1 因為外層迴圈只要跑 n - 1 次就好
	mov ecx, n							; 在 call mini proc 前先把 ecx 準備好
	mov esi, OFFSET arr					; 把 esi 歸 0 回到記憶體位址的頭
	call mini

	mov edx, OFFSET format1				; 因為 WriteString 吃 edx 暫存器
	call WriteString
	cmp eax, 0							; 如果 small 是正整數 or 0
	jge positive1						
	call WriteInt						; WriteInt 吃 eax, 輸出負值的 small
	call Crlf							; 內建換行寫法
	jmp conti							; 如果這邊不跳過 程式就會繼續往下執行 positive1

positive1:								; 如果 small 是正數
	call WriteDec						; 就輸出 decimal ( 沒有負數 )
	call Crlf

conti:
	mov ecx, n
	mov esi, OFFSET arr
	call maxi

	mov edx, OFFSET format2
	call WriteString
	cmp eax, 0
	jge positive2
	call WriteInt
	call Crlf
	jmp finish

positive2:
	call WriteDec
	call Crlf

finish:
	invoke ExitProcess, 0				; 離開程式
	main ENDP							; main 結束

mini PROC
	push esi							; 先把 esi 目前位址指向處 push 放入堆疊中
	push ecx							; 同理, 放入堆疊是因為等等 pop 出去後暫存器會回到 push 進去的狀態, 所以內部就算有改動也沒關係
	mov eax, [esi]
	mov small, eax						; 先預設 small 初始值是 arr[0]
	add esi, TYPE arr
	mov ecx, n
L2:			
	mov eax, [esi]				
	add esi, TYPE arr 
	cmp eax, small						; 因為不能兩邊都是記憶體位址, 所以要先 mov 進 eax 才去做比較
	jge skip1							; 如果大於等於就跳到 skip1
	mov small, eax						; 否則, 就重新紀錄當前 small 是誰
skip1:
	loop L2

	mov eax, small						; 等等回到 main proc 後 WriteInt 要用到 eax, 現在先存好
	pop ecx								; 後進去 ecx 的要先出來
	pop esi								; 要 pop 是為了讓他們回到進來 mini proc 前的狀態
	ret									; return 回去
	
	mini ENDP

maxi PROC								; 所有理論皆與 mini 同理
	push esi
	push ecx
	mov eax, [esi]
	mov large, eax
	add esi, TYPE arr
	mov ecx, n
L3:			
	mov eax, [esi]				
	add esi, TYPE arr 
	cmp eax, large
	jle skip2
	mov large, eax
skip2:
	loop L3

	mov eax, large
	pop ecx
	pop esi
	ret

	maxi ENDP

END main