# 452. Minimum Number of Arrows to Burst Balloons

> 難度：**Medium**
> 題型：`Greedy`
> 題目連結：[LeetCode](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)

## 題目摘要

給定一組氣球 points，其中 points[i] = [xstart, xend] 代表每顆氣球橫跨的水平直徑，箭可以從 x 軸上的任意一點射出，如果氣球橫跨在該 x 座標上則會被射破 (xstart <= x <= xend)。回傳至少要幾支箭才可以射破所有氣球。

## 解題思路

### 關鍵觀察

- 對於排序混亂的氣球，要怎麼重新進行排序?
- 要射在氣球的哪個位置，才可以射破愈多氣球? 
- 對這顆最早結束的氣球而言，在右邊界射箭，可以盡可能同時碰到後面更多氣球。

### 演算法

1. 將氣球沿著右端點進行小到大的排序
2. 透過 right 記錄右端點的位置
3. 跑 For 迴圈，如果新氣球的左端點還在 right 的左端，代表這顆氣球會被目前這支箭射破
4. 如果新氣球的左端點，已經跑到上一支箭的右邊。則需要多一支箭才能射到新氣球，因此要把 right 更新至新氣球的最右端

## 複雜度

- 時間：`O(nlogn)` 瓶頸在 sorting
- 空間：`O(log n)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    int findMinArrowShots(vector<vector<int>>& points) {
        sort(points.begin(), points.end(), 
            [](const vector<int>& a, const vector<int>& b){
                return a[1] < b[1];
            });

        int right = points[0][1];
        int arrowcnt = 1;

        for (int i=1; i<points.size(); i++){
            if (right < points[i][0]){
                right = points[i][1];
                arrowcnt++;
            }
        }
        
        return arrowcnt;
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}
- std::sort 的 comparator 必須使用類似 < 的「strict ordering」，不能寫 <=

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
