INCLUDE header.inc					

.data
	heven DWORD ?
	teven DWORD ?

.code

sumeven PROC,
	oddarr: DWORD,
	evenarr: DWORD

	mov ebp, esp

	mov heven, edx
	mov teven, ecx

	mov edi, heven
	mov eax, 0
	mov esi, 0

odd:
	cmp esi, teven
	je fini

	add eax, [edi+esi*4]

	inc esi
	jmp odd

fini:
	mov heven, edx
	mov teven, ecx

	mov esp, ebp
	ret 8

sumeven ENDP
END