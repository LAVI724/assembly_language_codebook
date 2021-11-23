#include<bits/stdc++.h>
using namespace std;

int num, cnt = 0;
string multi = " * ";
string powoper = "^";

void PrimePro(){

    for(int i = 2; ; i++){
        if( num == 1 ){
            cout << endl;
            break;
        }

        if(num % i == 0){
            cout << i;
            while(num % i == 0){
                cnt++;
                num /= i;
            }
            if(cnt != 1){
                cout << powoper << cnt;
            }
            if(num != 1){
                cout << multi;
            }
            cnt = 0;
        }
    }
}

int main(){

    while(cin >> num){
        if(num < 0){
            break;
        }
        PrimePro();
    }

}