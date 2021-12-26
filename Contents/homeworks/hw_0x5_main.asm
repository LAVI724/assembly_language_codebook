.686									
.model flat, stdcall					
.stack 4096	

INCLUDE header.inc

.data
	flag DWORD ?
	N DWORD ?

.code

main PROC
	
	mov eax, 0
	mov flag, eax

begin:
	push ebp							; 把 ebp 的 old address 存起來
	mov ebp, esp						; 要把 ebp 拉到 esp 的位址

	call ReadInt
	cmp eax, 0
	jle fin								; 如果輸入等於 0 就判斷結束
	
	push eax							; 把 n 存進 stack 為了傳給其他 .asm
	mov N, eax

	call input

	cmp flag, 0
	je noendl

	call Crlf

noendl:
	push edi							; push 存 head
	push N								; push N
	call sort

	mov eax, 1
	mov flag, eax

	mov eax, N
	mov ebx, 2
	cdq
	div ebx
	cmp edx, 1
	je odd

	mov esi,eax
	
	mov eax, [edi+esi*4]
	cmp eax, 0
	jg positive1

	call WriteInt
	jmp space

positive1:
	call WriteDec

space:
	mov al, ' '
	call WriteChar

	dec esi
	mov eax, [edi+esi*4]
	cmp eax, 0
	jg positive2

	call WriteInt
	jmp endl

positive2:
	call WriteDec

endl:
	call Crlf
	jmp begin

odd:
	mov esi,eax
	
	mov eax, [edi+esi*4]
	cmp eax, 0
	jg positive3

	call WriteInt
	jmp endl

positive3:
	call WriteDec
	jmp endl						; 回來後繼續新的一趟吃輸入

fin:									; 函式結束
	mov esp, ebp						; 最後也要記得清空
	pop ebp
	INVOKE ExitProcess, 0				; 結束

main ENDP

END main
