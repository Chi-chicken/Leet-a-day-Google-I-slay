# 2078. Two Furthest Houses With Different Colors

> 難度：**Easy**
> 題型：`{題型}`
> 題目連結：[LeetCode](https://leetcode.com/problems/two-furthest-houses-with-different-colors/)

## 題目摘要

給定一個 n 個元素的整數陣列 colors[i]，代表第 i 間房子的顏色，要找兩間顏色不同的房子可以形成的最大距離

## 解題思路



### 關鍵觀察

- 不同顏色的房子的最大距離一定出現在最邊邊的房子和另一頭數過來的其中一棟

### 演算法

1. 紀錄最右邊房子的顏色，從左往右找第一棟顏色不一樣的房子，計算之間的距離
2. 紀錄最左邊房子的顏色，從右往左找第一棟顏色不一樣的房子，計算之間的距離
3. 最右端房子能形成的最大距離 vs 最左端房子能形成的最大距離

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
    int maxDistance(vector<int>& colors) {
        int n = colors.size();

        int dis1 = 0;
        for (int i = 0; i < n - 1; i++) {
            if (colors[i] != colors[n - 1]) {
                dis1 = n - 1 - i;
                break;
            }
        }

        int dis2 = 0;
        for (int i = n - 1; i > 0; i--) {
            if (colors[i] != colors[0]) {
                dis2 = i;
                break;
            }
        }

        return max(dis1, dis2);
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| jamesym-lin | 2026-08-08 | YYYY-MM-DD | 3 | 要讓距離最大，至少有一側應該盡可能靠近陣列邊界 |
