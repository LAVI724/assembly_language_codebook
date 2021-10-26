// cpp
#include <cstdio>
#include <cstdlib>
#include <string.h>

using namespace std;

extern "C" int asmMain();

extern "C" int AllPrimeNumbers(int);

int main()
{
	int num = asmMain();

	system("pause");

	return 0;
}

int AllPrimeNumbers(int num)
{	
	int cnt = 0;
	bool prime[1000000];

	memset(prime, 0, sizeof(prime));

    for (int i = 2; i < num; i++) {

        if (!prime[i]) {

			printf("%d ", i);
			cnt++;

            for (int j = i + i; j < num; j += i) {

                prime[j] = true;

            }
        }
    }
	printf( "\nCnt is : " );

	return cnt;
}

// asm
.686p
.model flat, C
.stack 4096

includelib legacy_stdio_definitions.lib

ExitProcess PROTO, dwExitCode: DWORD

printf PROTO C,		; Std C library function
	format: PTR BYTE, args: VARARG		; (in libc.lib)

scanf PROTO C,			; STd C library function
	format: PTR BYTE, args: VARARG		; (in libc.lib)

AllPrimeNumbers PROTO C,
     dwInt: DWORD						; in main.cpp

TAB = 9

.data
	;  define your variables here
format1 BYTE "Give me an interger owo : ", 0

format2 BYTE "%d", 0

format3 BYTE "OK, so the integer N is... %d !",0dh, 0ah, 0

format4 BYTE "%d",0dh, 0ah, 0

format5 BYTE "And all prime numbers less than N is : ", 0

newLine BYTE 0dh, 0ah, 0

space BYTE " ", 0

Number DWORD ?

.code

asmMain PROC C
    push ebp
	mov	ebp, esp

	;  write your assembly code here
	INVOKE printf, ADDR format1

	INVOKE printf, ADDR newLine ; 換行

	INVOKE scanf, ADDR format2, ADDR Number		; scanf("%d", &Number)

	INVOKE printf, ADDR format3, Number			; printf("N : %d\n", Number)

	INVOKE printf, ADDR format5

	INVOKE printf, ADDR newLine

	INVOKE AllPrimeNumbers,  Number			; return value in EAX

	INVOKE printf, ADDR Format4, eax

	mov	eax, 0		; return 0
	pop	ebp

	ret

asmMain ENDP


END 