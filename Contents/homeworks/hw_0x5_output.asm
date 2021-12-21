INCLUDE header.inc					

.code

output PROC,							; 在 PROTO 有宣告參數 這裡也要宣告
	n: DWORD,
	arr: DWORD
			
	;push ebp
	mov ebp, esp

	mov edi, DWORD PTR[ebp+12]			; edi 存 head
	mov ecx, DWORD PTR[ebp+8]			; 在 input 已經存過 N 了

	mov esi, 0							; esi = i (as c++)

L1:
	cmp ecx, esi						
	je fin
	
	mov eax, [edi+esi*4]
	cmp eax, 0
	jge positive

	call WriteInt
	jmp space

positive:
	call WriteDec

space:
	mov al, ' '
	call WriteChar

	inc esi
	jmp L1


fin:									; 函式結束
	call Crlf
	mov esp, ebp						; 最後也要記得清空
	;pop ebp
	ret	8
	
output ENDP

END 