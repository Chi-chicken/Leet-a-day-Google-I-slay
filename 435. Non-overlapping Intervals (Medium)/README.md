# 435. Non-overlapping Intervals

> 難度：**Medium**
> 題型：`Greedy`, `Sorting`
> 題目連結：[LeetCode](https://leetcode.com/problems/non-overlapping-intervals/)

## 題目摘要

給定一個陣列 intervals，其中 intervals[i] = [starti, endi]。試問要移除 intervals 中多少個區間才能夠使剩下的區間不重疊?
 - 如果只重疊於一點的兩個區間定義為不重疊。For example, [1, 2] 和 [2, 3] 不重疊

## 解題思路

### 關鍵觀察

- 思考怎麼做選擇，才能讓剩餘的空間、或是未來的選擇空間最大?
- 每次選擇最早結束的 interval，可以為後面的 interval 留下最大的可選空間。

### 演算法

1. 每個區間都有頭尾，針對區間的尾巴 (intervals[i][1]) 由小到大進行排序。排序完後會呈現 intervals[i][1] <= intervals[i+1][1]
2. For 迴圈跑過 intervals，比較後者的頭有沒有蓋過前者的尾巴，如果有的話就要移除，沒有的話就保留。

## 複雜度

- 時間：`O(nlogn)` bottleneck 是 sorting
- 空間：`O(log n)` 若計入 std::sort stack：O(log n)

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    int eraseOverlapIntervals(vector<vector<int>>& intervals) {
        sort(intervals.begin(), intervals.end(),
            [](const vector<int>& a, const vector<int>& b) {
                return a[1] < b[1];
            });

        int n = intervals.size();
        int count = 1;
        int tail = intervals[0][1];

        for (int i = 1; i < n; i++) {
            if (intervals[i][0] >= tail) {
                count++;
                tail = intervals[i][1];
            }
        }

        return n - count;
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}
- sort() 第三個參數傳入比較函式，回傳 true 時，代表 a 應該排在 b 前面
- lambda 基本格式
```
[capture](parameters) {
    // function body
}
```

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
