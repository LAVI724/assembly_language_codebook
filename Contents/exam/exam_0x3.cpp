#include<bits/stdc++.h>
using namespace std;

unsigned cycle_length(unsigned n){
    unsigned cnt = 1;
    unsigned tmp = n;
    while(tmp != 1){
        if(tmp & 1){
            tmp = 3*tmp + 1;
        }
        else{
            tmp = tmp/2;
        }
        cnt++;
    }
    
    return cnt;
}

int main(){
    unsigned i, j;
    while(cin >> i && i){
        cin >> j;

        if(i > j){
            swap(i, j);
        }
        unsigned maxi = cycle_length(i);
        for(unsigned n = i+1; n <= j; n++){
            unsigned cnt = cycle_length(n);
            maxi = max(maxi, cnt);
        }

        cout << i << " " << j << " " << maxi << endl;
    }
}