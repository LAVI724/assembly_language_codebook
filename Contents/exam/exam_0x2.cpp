#include<bits/stdc++.h>
using namespace std;

int odd[200+5], even[200+5];
int hodd = 0, heven = 0;

int sumodd(){
    int sum = 0;
    for(int i = 0; i < hodd; i++){
        sum += odd[i];
    }

    return sum;
}

int sumeven(){
    int sum = 0;
    for(int i = 0; i < heven; i++){
        sum += even[i];
    }

    return sum;
}

int maximum(){
    int maxi = odd[0];
    for(int i = 0; i < hodd; i++){
        if(odd[i] > maxi){
            maxi = odd[i];
        }
    }

    for(int i = 0; i < heven; i++){
        if(even[i] > maxi){
            maxi = even[i];
        }
    }

    return maxi;
}

int minimum(){
    int mini = odd[0];
    for(int i = 0; i < hodd; i++){
        if(odd[i] < mini){
            mini = odd[i];
        }
    }

    for(int i = 0; i < heven; i++){
        if(even[i] < mini){
            mini = even[i];
        }
    }

    return mini;
}

void output(){
    cout << hodd << " ";
    for(int i = 0; i < hodd; i++){
        cout << odd[i] << " ";
    }

    cout << endl << heven << " ";
    for(int i = 0; i < heven; i++){
        cout << even[i] << " ";
    }
    cout << endl;
}

int main(){
    int n;
    while(cin >> n && n){
        if(n & 1){
            odd[hodd++] = n;
        }
        else{
            even[heven++] = n;
        }
    }

    output();
    cout << maximum() << " " << minimum() << endl;
    cout << sumodd() << " " << sumeven() << endl;
}