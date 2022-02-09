INCLUDE header.inc					

.code

cycle PROC,
	n: DWORD

	mov ebp, esp
	push ebx
	push ecx
	mov ebx, 1						; ebx 存 cnt
	mov edx, esi					; edx 存 tmp(n)

cycle_length:
	
	cmp edx, 1
	je	fini

	mov eax, edx
	AND eax, 1
	je evenum

oddnum:
	mov eax, edx
	mov edx, 3
	mul edx
	add eax, 1
	mov edx, eax
	add ebx, 1

	jmp cycle_length
	
evenum:
	mov eax, edx
	mov ecx, 2
	mov edx, 0
	div ecx
	mov edx, eax
	add ebx, 1

	jmp cycle_length

fini:
	
	mov eax, ebx					; eax 存 cn
	pop ecx
	pop ebx
	mov esp, ebp
	ret 4

cycle ENDP
END