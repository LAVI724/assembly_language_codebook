INCLUDE header.inc					

.data
	array DWORD 1000 DUP(?)

.code

input PROC,							; 在 PROTO 有宣告參數 這裡也要宣告
	n: DWORD
			
	;push ebp						; 有 PROC, n:DWORD assembly 就會自動 push ebp
	mov ebp, esp

	mov ecx, DWORD PTR[ebp+8]		; ecx 存 N (記憶體位址在現在的 ebp 往上 +8)
	mov ebx, ecx					; 因為往後陣列頭是固定的 所以要先存進別的暫存器

	lea edi, array					; 用 lea 不用 OFFSET array，一樣是直接傳 array 頭的記憶體"位址"
	mov esi, 0						; 先將 esi 設為 0 (現在 esi 相當於 c++ 程式中的 i)

L1:
	call ReadInt					; 建構 array
	mov [edi+esi], eax				; 在陣列頭 edi + esi(i*4格) 的位址存每一格的數值
	add esi, 4						; 手動把 esi 每次都 +4 開新空間

	dec ebx
	cmp ebx, 0
	jne L1

fin:								; 函式結束
	;mov esp, ebp
	;pop ebp						; 不用 pop 因為前面也沒有 push
	ret 8							; 要還 PROC, n:DWORD assembly 借用的空間
	
input ENDP

END									; 這邊不用接 input 因為只是副程式的結束而已