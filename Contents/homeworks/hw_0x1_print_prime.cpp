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