# 202. Happy Number (Easy)

> 難度：**Easy**
> 題目連結：[LeetCode](https://leetcode.com/problems/happy-number/)

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

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
