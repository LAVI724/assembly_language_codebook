INCLUDE header.inc

.code

main PROC

begin:
	;push ebp
	mov ebp, esp

	call ReadInt						; cin >> i
	cmp eax, 0
	je fini
	
	mov ebx, eax						; ebx 存 i
	call ReadInt
	mov ecx, eax						; ecx 存 j

	mov eax, ebx						; cout << i << " "
	call WriteDec

	mov al, ' '
	call WriteChar

	mov eax, ecx						; cout << j << " "
	call WriteDec

	mov al, ' '
	call WriteChar

swapij:
	
	mov eax, ebx
	cmp eax, ecx
	jle conti

	xchg ebx, ecx						; swap(i, j)
		
conti:
	mov esi, ebx						; esi 存 i (n)
	invoke cycle, esi

	mov edi, eax						; edi 存 maxi
	inc esi								; n++

cycle_loop:
	
	cmp esi, ecx						; if esi > ecx
	jg output

	invoke cycle, esi

	inc esi
	cmp edi, eax
	jge cycle_loop

maxi_change:
	mov edi, eax
	jmp cycle_loop

output:

	mov eax, edi						; cout << maxi << endl
	call WriteDec

	call Crlf
	jmp begin

fini:
	;mov esp, ebp
	;pop ebp
	INVOKE ExitProcess, 0

main ENDP

END main
