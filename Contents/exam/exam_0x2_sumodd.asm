INCLUDE header.inc					

.data
	hodd DWORD ?
	todd DWORD ?

.code

sumodd PROC,
	oddarr: DWORD,
	evenarr: DWORD

	mov ebp, esp

	mov hodd, ebx
	mov todd, esi

	mov edi, hodd
	mov eax, 0
	mov esi, 0

odd:
	cmp esi, todd
	je fini

	add eax, [edi+esi*4]

	inc esi
	jmp odd

fini:

	mov ebx, hodd
	mov esi, todd

	mov esp, ebp
	ret 8

sumodd ENDP
END