# 202. Happy Number (Easy)

🔗 [LeetCode Link](https://leetcode.com/problems/happy-number/)

## :beginner: Description

Q: Happy number是不斷把一正整數的每一位數平方相加，如果最後所得為1，則為Happy Number，return true；如果進入某種循環則不happy，return false  
EX:  

## :bulb: TIPS
1. 將每次循環出現過的數字放入unordered map或set之中，以確認該數字是否已經重複出現，若是的話，則表示進入了循環，return false  
2. X的平方: pow(x, 2)  

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    bool isHappy(int n) {
        unordered_map<int, int> map;
        int square_sum = 0;
        while (n != 1){
            while (n > 0){
                square_sum += pow((n % 10), 2);
                n /= 10;
            }
            n = square_sum;
            square_sum = 0;
            
            if (map.find(n) == map.end()) map[n] = 1;
            else return false;
        }
        return true;
    }
};
```

Runtime: 0 ms, Memory: 8.4 mb
