#include<bits/stdc++.h>
using namespace std;

int num[1000];
int n;

void output(){
    for(int i = 0; i < n; i++){
        cout << num[i] << " ";
    }
    cout << endl;
}

void selection_sort(){
    // selection sort
    // 每次都抓從 i 以後的最小值換到前面
    for(int i = 0; i < n-1; i++){
        int min = i;
        for(int j = i+1; j < n; j++){
            if(num[j] < num[min]){
                min = j;
            }
        }
        // 並且將最小值與當前那陣列位址的值做交換
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

        // 輸出中位數
        if(n % 2){
            cout << num[n/2];
        }
        else{
            cout << num[n/2] << " " << num[n/2-1];
        }

        cout << endl;
    }
}