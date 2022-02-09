.686									
.model flat, stdcall					
.stack 4096	

INCLUDE Irvine32.inc

.data
	N DWORD ?
	NF REAL8 ?
	arr REAL8 305 DUP(?)
	sum REAL8 0.0
	mini REAL8 ?
	maxi REAL8 ?
	tmp REAL4 ?

.code
main PROC
	finit

begin:
	call ReadDec

	mov N, eax
	mov edi, OFFSET arr
	mov ecx, eax

input:
	cmp ecx, 0
	je prepare

	call ReadFloat
	fstp REAL8 PTR[edi]
	add edi, TYPE REAL8
	sub ecx, 1
	jmp input

prepare:
	mov ecx, N
	sub ecx, 1
	mov edi, OFFSET arr
	fld REAL8 PTR[edi]						; st(0) = arr[0] = mini
	fstp mini
	fld REAL8 PTR[edi]						; st(0) = arr[0] = mini
	fstp maxi
	fld REAL8 PTR[edi]						; st(0) = arr[0] = mini
	fstp sum
	add edi, TYPE REAL8
mini_find:
	cmp ecx, 0
	je mini_maxi_output

sum_calu:
	fld REAL8 PTR[edi]
	fadd sum
	fstp sum

	fld mini
	fld REAL8 PTR[edi]
	fcom st(1)
	fnstsw ax
	sahf
	jna mini_change

maxi_find:
	finit
	fld maxi
	fld REAL8 PTR[edi]
	fcom st(1)
	fnstsw ax
	sahf
	jnb maxi_change

	finit
	sub ecx, 1
	add edi, TYPE REAL8
	jmp mini_find

mini_change:
	fstp mini
	finit
	sub ecx, 1
	add edi, TYPE REAL8
	jmp mini_find

maxi_change:
	fstp maxi
	finit
	sub ecx, 1
	add edi, TYPE REAL8
	jmp mini_find

mini_maxi_output:
	fld mini
	call WriteFloat
	mov al, ' '
	call WriteChar
	fld maxi
	call WriteFloat
	call Crlf
	fld sum
	call WriteFloat
	call Crlf

prod:
	fld mini
	fmul maxi
	call WriteFloat
	call Crlf

sum_divide_N:
	fild N
	fstp NF
	fld sum
	fdiv NF
	call WriteFloat
	call Crlf

sqrt_abs_calu:
	fld sum
	fabs
	fsqrt
	call WriteFloat
	call Crlf

fini:
	ret

main ENDP
END main