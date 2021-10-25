//  Java

//  基礎運算判斷

// java 中要用 .hasNext() 來判斷是否輸入結束
while( input.hasNext() )

// java 用 == 進行比較的時候，比較的是他們在記憶體中的存放地址
// 而 String,Integer,Date 這些類中 equals 可以用來做比較
if( str.equals("0") ){
    break;
}
// ---

//  Scanner

// String 的 input 是 .nextLine()
String str = input.nextLine();

// int 的 input 是 .nextInt()
int n = input.nextInt()

// boolean 的 input 是 .nextBoolean()
boolean flag = input.nextBoolean()
// ---

//  vector

// java 的 vector 寫法似乎是如此 :D
// <> 內不能寫 int 要寫 Integer
Vector<Integer> v = new Vector();

    // 像 C++ 的 v.push_back(i)
    v.add(i);

    int i;
    for( i = 0; i < v.size()-1; i++ ){

        // 不能直接寫 v[i] 要寫 v.get(i)
        System.out.printf( "%d ", v.get(i) );
    }
    System.out.printf( "%d\n", v.get(i) );
// ---

//  memset

// Arrays.fill 類似 C++ 的 memset( a, false, sizeof(a) );
Arrays.fill( prime,false );
// ---

//  Math

// java 的 abs 前面要加 Math.
if( Math.abs( first - second ) % 11 == 0 ){
    System.out.printf("%s is a multiple of 11.\n", str );
}
// ---

//  變數型態轉換

for( int i = 0; i < array.length; i++ ){
            // java 的 string to double 寫法
            tmp[i] = Double.parseDouble(array[i]);
        }
// ---

//  str.split

// 當字串中帶有 + * | \ 等符號時要寫 \\ 轉義，因為他們在正則表達示中有相應的不同意義
        // limit is 0; array contains all substrings
        // Positive Lookahead or Lookbehind 觀念
        // “((?=@)|(?<=@))” -> 才會把 運算子 還有 運算元 都單獨切開
        String[] array = str.split("((?=\\+|-|\\*|/|\\)|\\(|%)|(?<=\\+|-|\\*|/|\\)|\\(|%))",0);

        // 預設 ans 賦值 可控制小數點位數 ex 0.000 -> 小數點後三位
        BigDecimal ans = new BigDecimal("0.000");
// ---

// StringTokenizer

// 取運算子的部分用 StringTokenizer 更為方便
        StringTokenizer st = new StringTokenizer(str,"0123456789.");
        boolean flag = true;
        while(st.hasMoreTokens()){
            System.out.print( flag ? st.nextToken() : " " + st.nextToken());
            flag = false;
        }
// ---

//  string.contains()

boolean flag = true;
        for( String check : array){
            // string.contains 一次查詢多個關鍵字的寫法 要另外存一個數組 token
            // 且在查詢時要以此 for ( String check : array ) 去做掃描
            if( !token.contains(check) ){
                // 將字串型態的數字轉成實數並相加
                BigDecimal b = new BigDecimal(check);
                // (boolean 判斷式) ? (true的輸出) : (false 的輸出)
                System.out.print( flag ? check : " " + check);
                flag = false;

                // BigDecimal 內建 .add 可以直接相加
                ans = ans.add(b);
            }
        }
// ---

//  BigDecimal

BigDecimal b = new BigDecimal(check);
                // (boolean 判斷式) ? (true的輸出) : (false 的輸出)
                System.out.print( flag ? check : " " + check);
                flag = false;

                // BigDecimal 內建 .add 可以直接相加
                ans = ans.add(b);
// -

// BigDecimal 四捨五入的寫法 .setScale( 想要留取的位數, RoundingMode.HALF_UP)
        System.out.println(ans.setScale(3, RoundingMode.HALF_UP));
// ---


// 1-13

package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        double x1 = 0, y1 = 0, a1 = 0, x2 = 0, y2 = 0, a2 = 0;

        x1 = input.nextDouble();
        y1 = input.nextDouble();
        a1 = input.nextDouble();
        x2 = input.nextDouble();
        y2 = input.nextDouble();
        a2 = input.nextDouble();

        // 克萊姆公式
        // [a b][x] = [e]
        // [c d][y] = [f]
        // x = ed - bf / ad - bc
        // y = af - ec / ad - bc

        double x = 0, y = 0;
        x = ( ( a1 * y2 ) - ( y1 * a2 ) ) / ( ( x1 * y2 ) - ( y1 * x2 ) );
        y = ( ( x1 * a2 ) - ( a1 * x2 ) ) / ( ( x1 * y2 ) - ( y1 * x2 ) );

        System.out.println(x + " " + y);
    }
}
// ---

//  Chapter 2-6

package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	    Scanner input = new Scanner(System.in);
        String str = input.nextLine();

        // 先把字串內的每位數單獨拆分進 array 內
        String[] array = str.split("");

        Integer ans = new Integer(1);
        for( int i = 0; i < str.length(); i++ ){

            // 用 Integer.parseInt() 把 array[i] 內的字符轉數字
            ans = Integer.parseInt(array[i]) * ans;
        }

        System.out.println(ans);
    }
}

// ---

// 多筆測資輸入判斷
        double x1 = 0, y1 = 0, x2 = 0, y2 = 0;
        while(input.hasNext()){
            x1 = input.nextDouble();
            y1 = input.nextDouble();
            x2 = input.nextDouble();
            y2 = input.nextDouble();
        }
// ---

//  Chapter 2-15

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	    Scanner input = new Scanner(System.in);

        double x1 = 0, y1 = 0, x2 = 0, y2 = 0;
        
        // 讀取四個輸入
        x1 = input.nextDouble();
        y1 = input.nextDouble();
        x2 = input.nextDouble();
        y2 = input.nextDouble();

        // 利用 Math.pow 和 Math.sqrt 做運算
        System.out.println( Math.sqrt( Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2) ) );
    }
}
// ---

//  2-19

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Scanner;

public class Main {

    private static Math Precision;

    public static void main(String[] args) {
	    Scanner input = new Scanner(System.in);

        double x1 = 0, y1 = 0, x2 = 0, y2 = 0, x3 = 0, y3 = 0;

        x1 = input.nextDouble();
        y1 = input.nextDouble();
        x2 = input.nextDouble();
        y2 = input.nextDouble();
        x3 = input.nextDouble();
        y3 = input.nextDouble();

        double[] array = new double[3];
        array[0] = Math.sqrt( Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2) );
        array[1] = Math.sqrt( Math.pow(x3 - x2, 2) + Math.pow(y3 - y2, 2) );
        array[2] = Math.sqrt( Math.pow(x3 - x1, 2) + Math.pow(y3 - y1, 2) );

        // 判斷是否為三角形
        // Arrays.sort(陣列名稱) -> 自動排序
        Arrays.sort(array);

        if ( array[0] + array[1] <= array[2] ){
            System.out.println("Not Triangle");
        }
        else{
            // 海龍公式
            double s = 0;
            for( int i = 0; i < 3; i++ ){
                s = s + array[i];
            }
            s = s / 2;

            double a = 0;
            a = Math.sqrt( s * (s-array[0]) * (s-array[1]) * (s-array[2]) );
            
            // 利用 BigDecimal 去取小數點並四捨五入
            BigDecimal ans = new BigDecimal(a);
            System.out.println( ans.setScale(3, RoundingMode.HALF_UP));
        }


    }
}

// ---

- hypot

//  primelist

package com.company;

import java.util.Arrays;
import java.util.Scanner;
import java.util.Vector;

public class Main {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();

        // 建質數表
        // java 中沒有全域變數 所以這邊建表目前是每次輸入都重建一次 但不夠漂亮
        boolean[] prime = new boolean[10000000+5];

        // 用 vector 存質數們
        Vector<Integer> v = new Vector<Integer>();
        for( int i = 2; i <= n; i++ ){
            if(!prime[i]){
                v.add(i);
                for( int j = i * i; j <= n; j += i ){
                    prime[j] = true;
                }
            }
        }

        for( int i = 0, k = 0; i < v.size(); i++, k++ ){

            if( k == 9 || i == v.size() - 1){
                System.out.println(v.get(i));
                // 把 k 歸回去 -1 是因為下次輪迴會先 k++
                k = -1;
            }
            else{
                System.out.print(v.get(i) + " ");
            }
        }
        v.clear();
    }
}
// ---

//  3-11

package com.company;

import java.util.Arrays;
import java.util.Scanner;
import java.util.Vector;

public class Main {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int month = input.nextInt();
        int year = input.nextInt();

        // 分別存 30 天的月份 和 31 天的月份 以及他們的英文月份名
        int[] thirty = {1,3,5,7,8,10,12};
        String[] thirty_eng = {"January", "March", "May", "July", "August", "October", "December"};

        int[] thirty_one = {4,6,9,11};
        String[] thirty_one_eng = {"April", "June", "September", "November"};

        // 查詢他是否是 30 天的月份
        // 最後放 return 後面的其他程式碼就不會執行了
        for( int i = 0; i < thirty.length; i++){
            if(month == thirty[i]){
                System.out.println(thirty_eng[i] + " " + year + " had 31 Days" );
                return;
            }
        }
        for( int i = 0; i < thirty_one.length; i++){
            if(month == thirty_one[i]){
                System.out.println(thirty_one_eng[i] + " " + year + " had 31 Days" );
                return;
            }
        }
        if( year % 4 == 0){
            System.out.println("February " + year + " had 29 Days");
            return;
        }
        System.out.println("February " + year + " had 28 Days");

    }
}
// ---