# 33. Search in Rotated Sorted Array

> 難度：**Medium**
> 題型：`Binary Search`
> 題目連結：[LeetCode](https://leetcode.com/problems/search-in-rotated-sorted-array/)

## 題目摘要

給定一個嚴格遞進的有序陣列 nums，其可能被任意旋轉不固定數量單位，找出 target 在 nums 中的索引，若 nums 中沒有target，則回傳 -1
必須給出一個演算法時間複雜度為 O(log n)

## 解題思路

### 關鍵觀察

- 對任意一個 mid，左半邊與右半邊之中，至少有一邊一定是 sorted
- 若時間複雜度期望符合 O(log n)，則得採用 binary search

### 演算法

1. Binary Search
2. 找 mid
3. 判斷哪一半有序
4. 判斷 target 是否在有序區間內
5. 若在，就搜尋該側；否則搜尋另一側

## 複雜度

- 時間：`O(log n)`
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
    int search(vector<int>& nums, int target) {
        int left = 0, right = nums.size() - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (nums[mid] == target)
                return mid;

            // 左半邊有序
            if (nums[left] <= nums[mid]) {
                if (nums[left] <= target && target < nums[mid])
                    right = mid - 1;
                else
                    left = mid + 1;
            }
            // 右半邊有序
            else {
                if (nums[mid] < target && target <= nums[right])
                    left = mid + 1;
                else
                    right = mid - 1;
            }
        }

        return -1;
    }
};
```

## 邊界條件與筆記

- 邊界條件: 小心搜尋區間只剩一個元素 (left == mid == right)
- int mid = left + (right - left) / 2; 為了避免 integer overflow

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
