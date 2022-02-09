#include<bits/stdc++.h>
using namespace std;

int main(){
    int N;
    cin >> N;
    float num[N];
    for(int i = 0; i < N; i++){
        cin >> num[i];
    }

    float mini = num[0], maxi = num[0], sum = num[0];
    for(int i = 1; i < N; i++){
        sum += num[i];
        mini = min(mini, num[i]);
        maxi = max(maxi, num[i]);
    }
    cout << scientific << mini << " " << maxi << endl;
    cout << scientific << sum << endl;
    cout << scientific << mini*maxi << endl;
    cout << scientific << sum/N << endl;
    cout << scientific << sqrt(abs(sum)) << endl;
}   
/*
9
8.5
3.5
-1.5
-2.0
14.5
29.0
10.6
11.4
-6.5
*/