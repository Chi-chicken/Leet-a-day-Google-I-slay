# 121. Best Time to Buy and Sell Stock

> 難度：**Easy**
> 題型：`Greedy`
> 題目連結：[LeetCode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

## 題目摘要

給定 prices 代表每一天的股價，可以選擇一天買入股票、一天賣出股票，回傳能夠取得的淨利最大值

## 解題思路

### 關鍵觀察

- 如果要賺到最多錢，到目前為止，只保留最便宜的買入機會。

### 演算法

1. 創建一變數 lowest 紀錄目前出現過的最低股價，另一個變數 maxProfit 紀錄目前能夠取得的最大淨利值
2. 跑 For 迴圈，如果當下股價低於 lowest 則更新 lowest，否則以當天股價算淨利並更新 maxProfit

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
    int maxProfit(vector<int>& prices) {
        int lowest = prices[0];
        int maxProfit = 0;
        
        for (int i=1; i<prices.size(); i++){
            lowest = min(lowest, prices[i]);
            maxProfit = max(maxProfit, prices[i]-lowest);
        }
        return maxProfit;
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
