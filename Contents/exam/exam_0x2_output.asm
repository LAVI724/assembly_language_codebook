INCLUDE header.inc					

.data
	hodd DWORD ?
	heven DWORD ?
	todd DWORD ?
	teven DWORD ?

.code

output PROC,
	oddarr: DWORD,
	evenarr: DWORD

	mov ebp, esp

	mov hodd, eax
	mov heven, ebx
	mov todd, esi
	mov teven, ecx

	mov eax, todd
	call WriteInt
	mov al, ' '
	call WriteChar

	mov esi, 0
	mov edi, hodd

odd:
	cmp esi, todd
	je endl

	mov eax, [edi+esi*4]
	call WriteInt
	mov al, ' '
	call WriteChar

	inc esi
	jmp odd

endl:
	call Crlf

	mov eax, teven
	call WriteInt
	mov al, ' '
	call WriteChar

	mov esi, 0
	mov edi, heven

eveni:
	cmp esi, teven
	je fin

	mov eax, [edi+esi*4]
	call WriteInt
	mov al, ' '
	call WriteChar

	inc esi
	jmp eveni

fin:
	call Crlf

	mov eax, hodd
	mov ebx, heven
	mov esi, todd
	mov ecx, teven

	mov esp, ebp
	ret 8

output ENDP
END