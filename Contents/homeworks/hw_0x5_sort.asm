INCLUDE header.inc
.data
	min DWORD ?

.code
sort PROC,						; 在 PROTO 有宣告參數 這裡也要宣告
	n: DWORD,
	arr: DWORD
			
	;push ebp
	mov ebp, esp

	mov ecx, DWORD PTR[ebp+8]		; ecx 存 N
	mov edi, DWORD PTR[ebp+12]		; edi 存 head

	mov esi, 0						; esi = i (as c++)

L1:
	mov eax, ecx
	dec eax
	cmp eax, esi					; if i == n, jmp
	je fin
	
	mov eax, [edi+esi*4]
	mov min, esi					; c++ 裡的 min = i

	push esi						; 先把 esi = i 存起來
	add esi, 1
L2:
									; j = i + 1 = esi + 4
	cmp ecx, esi					; if j == n , jmp
	je swap

	mov eax, [edi+esi*4]
	mov edx, min
	cmp eax, [edi+edx*4]			; 比較 array[j] 和 array[min]
	jge conti						; 大於等於就跳轉

	mov min, esi					; min = j

conti:
	
	add esi, 1				; j++
	jmp L2
	
swap:
	pop esi
	mov eax, [edi+esi*4]			; tmp = array[i]
	mov edx, min
	mov ebx, [edi+edx*4]			; tmp = array[min]
	xchg eax, ebx					; swap array[i], array[min]
	mov [edi+esi*4], eax
	mov [edi+edx*4], ebx

	mov ebx, esi
	push edi
	push ecx						; 重新 push N
	call output
	
	mov esi, ebx
	add esi, 1
	jmp L1

fin:								; 函式結束
	mov esp, ebp					; 最後也要記得清空
	;pop ebp
	ret 8							; 結束
	
sort ENDP

END