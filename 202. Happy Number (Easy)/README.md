# 202. Happy Number (Easy)

> 難度：**Easy**  \n> 題目連結：[LeetCode](https://leetcode.com/problems/happy-number/)

🔗 [LeetCode Link](https://leetcode.com/problems/happy-number/)

## 題目摘要

Q: Happy number是不斷把一正整數的每一位數平方相加，如果最後所得為1，則為Happy Number，return true；如果進入某種循環則不happy，return false
EX:

## 解題思路
1. 將每次循環出現過的數字放入unordered map或set之中，以確認該數字是否已經重複出現，若是的話，則表示進入了循環，return false
2. X的平方: pow(x, 2)

## Python

```python
class Solution:
    def isHappy(self, n: int) -> bool:

        def get_next(n):
            total_sum = 0
            while n > 0:
                n, digit = divmod(n, 10)
                total_sum += digit ** 2
            return total_sum

        seen = set()
        while n != 1 and n not in seen:
            seen.add(n)
            n = get_next(n)
        return n == 1
```
Runtime: 0 ms, Memory: 17.7 mb

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

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
