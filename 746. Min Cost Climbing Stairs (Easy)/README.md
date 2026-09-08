# 746. Min Cost Climbing Stairs

> 難度：**Easy**
> 題型：`Dynamic Programming`
> 題目連結：[LeetCode](https://leetcode.com/problems/min-cost-climbing-stairs/)

## 題目摘要

1. 給定整數陣列 cost，其中 cost[i] 是走到該階梯所需要消耗的花費
2. 每次往上爬可以選擇爬 1 階或是 2 階
3. 起始位置可以是第 0 階或是第 1 階
4. 回傳走到樓梯頂部的最小花費，頂部的定義是在最後一階之後 (index cost.length)

## 解題思路

### 關鍵觀察

- 當下階梯的最小花費要根據前一階或是前兩階判斷

### 演算法

1. Transition: dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
2. Answer: min(dp[n - 1], dp[n - 2])

## 複雜度

- 時間：`O(n)`
- 空間：`O(1)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    int minCostClimbingStairs(vector<int>& cost) {
        int n = cost.size();
        for (int i=2; i<n; i++){
            cost[i] = min(cost[i-2], cost[i-1]) + cost[i];
        }
        return min(cost[n-1], cost[n-2]);
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
