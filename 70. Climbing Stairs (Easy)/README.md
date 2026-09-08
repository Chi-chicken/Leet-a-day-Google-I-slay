# 70. Climbing Stairs

> 難度：**Easy**
> 題型：`Dynamic Programming`
> 題目連結：[LeetCode](https://leetcode.com/problems/climbing-stairs/)

## 題目摘要

You are climbing a staircase. It takes `n` steps to reach the top.

Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?

**Example 1:**

>**Input:** `n = 2`
>
>**Output:** `2`
>
>**Explanation:** There are two ways to climb to the top.
>1. 1 step + 1 step
>2. 2 steps

**Example 2:**

>**Input:** `n = 3`
>
>**Output:** `3`
>
>**Explanation:** There are three ways to climb to the top.
>1. 1 step + 1 step + 1 step
>2. 1 step + 2 steps
>3. 2 steps + 1 step

**Constraints:**

*   `1 <= n <= 45`

## 複雜度

- 時間：`O(n)` 
- 空間：`O(1)` 

## Python

```python
class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 1 :
            return 1
        first = 1
        second = 2
        for i in range(3, n+1):
            third = first + second
            first = second
            second = third
        return second
```
Runtime: 0ms, Memory: 17.8mb

## C++

```cpp
class Solution {
public:
    int climbStairs(int n) {
        int prev2 = 1, prev1 = 2, curr;

        if (n==1) return prev2;
        else if (n==2) return prev1;
        else {
            for (int i=2; i<n; i++){
                curr = prev2 + prev1;
                prev2 = prev1;
                prev1 = curr;
            }
        }
        return curr;
    }
};
```

Runtime: ms, Memory: mb

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
