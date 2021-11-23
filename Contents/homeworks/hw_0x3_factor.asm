.686									
.model flat, stdcall					
.stack 4096								

INCLUDE Irvine32.inc
ExitProcess PROTO, dwExitCode: DWORD	

.data									
num DWORD ?
cnt DWORD 0
multi DWORD " * ", 0
pow DWORD "^", 0

.code

PrimePro PROC
	
	mov ebx, 1							; 賦予初值 1 不是 2 等等就會加(ebx 是我 for 迴圈的 int i)
F1:
	inc ebx
	mov cnt, 0
	mov eax, num
	cmp eax, 1							; 先判斷是不是 1
	je finofprime						; 如果是 1 直接輸出換行

	mov edx, 0							; 先把 edx 清零
	div ebx								; div 公式是 eax/ 你現在寫的位址 
	mov eax, num						; 此時 eax 被商覆蓋 改回 num
	cmp edx, 0							; 組語的除法餘數放 edx (商放 eax -> 此時的 eax = num/ebx)
	je F2								; 如果可以被整除就跳去算這因數有幾次
	
	jmp F1								; 不行的話就繼續迴圈

F2:
	mov num, eax						; 讓 eax 覆蓋 num (為了第二次迴圈後 num /= i)
	mov eax, ebx						; 把 ebx 移至 eax 為了輸出
	call Writedec						; Writedec 吃 eax 輸出因數
	mov eax, num						; 因為剛剛為了輸出而把 eax 覆蓋掉了 現在改回來

again:
	mov num, eax						; num /= i
	mov eax, cnt						; cnt++
	inc eax
	mov cnt, eax
	mov eax, num						; 為了 div 公式 把 eax 改成 num
	mov edx, 0
	div ebx								; eax/ebx = eax...edx
	cmp edx, 0							; 如果 num 還可以繼續被此因數整除
	je again
	
	mov eax, cnt						; 因為我把判斷和內容都寫在 again 這樣輪迴會多跑一次 cnt++
	dec eax								; 所以要 cnt -= 1
	mov cnt, eax
	jmp output
	
output:
	cmp eax, 1							; 如果此因數不只一次才要輸出 ^
	je nextif
	
	mov edx, OFFSET pow					; 輸出 ^
	call WriteString
	mov eax, cnt
	call Writedec						; 剛剛已經讓 eax = cnt 現在只要直接輸出就好

nextif:
	mov eax, num
	cmp eax, 1							; 如果不是最後一個因數了就輸出 *
	je F1

	mov edx, OFFSET multi				; 輸出 *
	call WriteString
	jmp F1
	
finofprime:
	call crlf							; 輸出換行
	ret

PrimePro ENDP


main PROC

begin:
	call readint
	cmp eax, 0
	jle fin								; 有號數小於等於就跳轉 如果輸入小於 0 就判斷結束
	mov num, eax
	call PrimePro
	jmp begin							; 回來後繼續新的一趟吃輸入

fin:									; 函式結束
	ret
main ENDP

END main