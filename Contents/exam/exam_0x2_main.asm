.686									
.model flat, stdcall					
.stack 4096	

INCLUDE header.inc

.data
	oddarr DWORD 205 DUP(?)
	evenarr DWORD 205 DUP(?)

.code

main PROC

	mov esi, 0							; esi 存 hodd
	mov ecx, 0							; ecx 存 heven

begin:
	push ebp
	mov ebp, esp

	call ReadInt
	cmp eax, 0
	je start
	
	mov ebx, eax
	AND eax, 1
	je eveni								; if eax == 0 -> even

odd:
	lea edi, oddarr
	mov [edi+esi*4], ebx
	add esi, 1
	jmp begin

eveni:
	lea edi, evenarr
	mov [edi+ecx*4], ebx
	add ecx, 1
	jmp begin

start:
	lea edi, oddarr
	mov eax, edi
	lea edi, evenarr
	mov ebx, edi
	call output

maxi:
	call maximum


	call WriteInt
	mov al, ' '
	call WriteChar

mini:
	call minimum

	call WriteInt
	mov al, ' '
	call WriteChar

	call Crlf

sumo:
	call sumodd

	call WriteInt
	mov al, ' '
	call WriteChar

sume:
	call sumeven

	call WriteInt
	mov al, ' '
	call WriteChar

	call Crlf

fini:
	mov esp, ebp
	pop ebp
	INVOKE ExitProcess, 0

main ENDP

END main
