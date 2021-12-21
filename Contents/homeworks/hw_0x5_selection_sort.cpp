#include<bits/stdc++.h>
using namespace std;

int num[100];
int n;

void output(){
    for(int i = 0; i < n; i++){
        cout << num[i] << " ";
    }
    cout << endl;
}

void selection_sort(){
    for(int i = 0; i < n-1; i++){
        int min = i;
        for(int j = i+1; j < n; j++){
            if(num[j] < num[min]){
                min = j;
            }
        }
        swap(num[i], num[min]);
        output();
    }
}

void input(){
    for(int i = 0; i < n; i++){
        cin >> num[i];
    }
}

int main(){
    
    bool flag = false;

    while(cin >> n && n){
        
        input();
        selection_sort();

        if(flag){
            cout << endl;
        }

        output();

        if(n % 2){
            cout << num[n/2];
        }
        else{
            cout << num[n/2-1] << " " << num[n/2];
        }

        cout << endl;
    }
}