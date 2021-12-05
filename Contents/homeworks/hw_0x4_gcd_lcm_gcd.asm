INCLUDE gcd.inc							

.code

gcd PROC
	push ebp						; 把 ebp 的 old address 存起來
	mov ebp, esp					; 要把 ebp 拉到 esp 的位址
	sub esp, 4						; 用 esp 向下開一個新空間 Rem

	mov ecx, DWORD PTR[ebp+12]		; 現在 eax 裡面放的是 m
	mov ebx, DWORD PTR[ebp+8]		; 現在 ebx 裡面放的是 n

	mov eax, ebx					; div  的被除數 是 eax
	cdq								; 清空 edx
	div ecx							; eax/ecx = eax...edx
	cmp edx, 0						; 如果不餘 0 就繼續遞迴
	jne Euclidean_Algorithm

	mov eax, ecx					; 把最大公因數 (現在在 ecx 裡) 存給 eax, eax 個檔案共用 所以回去 main 的時候也還是最大公因數 
	mov esp, ebp					; 把 ebp 指到現在 esp 的位址
	pop ebp							; 叫出 ret address
	ret 8							; 清空 8 格 stack 房間 (清空舊的 n 和 m)

Euclidean_Algorithm:				; 輾轉相除法 遞迴 ver.
	mov DWORD PTR[ebp-4], edx		; 把現在的餘數 edx 放進 Rem (DWORD PTR[ebp-4])
	push DWORD PTR[ebp-4]			; 把餘數(n%m) push 進去
	push ecx						; 把 m 放進去遞迴
	call gcd						; 遞迴 gcd

	mov esp, ebp					; 最後他一層一層 ret 回來的時候繼續清空舊的 n 和 m
	pop ebp
	ret 8

gcd ENDP

END gcd