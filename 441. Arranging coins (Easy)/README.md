# 441. Arranging Coins

🔗 [LeetCode Link](https://leetcode.com/problems/arranging-coins/)

## :beginner: Description

給定 n 個硬幣，試問可以填滿幾層階梯 (階梯為 a1 = 1 的等差數列)

**TIPS:**  
Binary Search 解法:

1. 從第 1 層至第 i 層可容納的硬幣數由梯形公式 (1+i)*i / 2 求得
2. 使用 binary search：
   - 設 start = 1, end = n，在 while (start <= end) 條件下反覆搜尋
   - 若某層容納的硬幣數 ≤ n，代表此層可填滿，更新 ans 並將 start 設為 mid + 1
   - 否則將 end 設為 mid - 1

數學解法:

1 + 2 + 3 + ... + x = n
→ (1 + x)x / 2 = n
→ x = -0.5 + sqrt(2n + 0.25)

**Constraints:**  
* 1 <= n <= 2^31 - 1

## Python 

```python
class Solution:
    def arrangeCoins(self, n: int) -> int:
        left, right = 0, n
        while left <= right:
            k = (right + left) // 2
            curr = k * (k + 1) // 2
            if curr == n:
                return k
            if n < curr:
                right = k - 1
            else:
                left = k + 1
        return right
```
Runtime: 3 ms, Memory: 17.7 mb

## C++ (Binary Search)

```c++
class Solution {
public:
    int arrangeCoins(int n) {
        long start = 1, end = n;
        long ans = 0, mid = 0;

        while (start <= end){
            mid = (start+end) / 2;
            if ( (1+mid)*mid /2 <= n){
                ans = mid;
                start = mid + 1;
            }
            else{
                end = mid - 1;
            }
        }
        return ans;
    }
};
```
Runtime: 0 ms, Memory: 8.88 mb

## C++ (Mathematics)

```c++
// Mathematical one-liner
class Solution {
public:
    int arrangeCoins(int n) {
        return (int)((-1 + std::sqrt(1 + 8.0 * (long long)n)) / 2);
    }
};
```
Runtime: 0 ms, Memory: 8.88 mb

