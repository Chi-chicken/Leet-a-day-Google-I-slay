# 153. Find Minimum in Rotated Sorted Array

> 難度：**Medium**
> 題型：`Binary Search`
> 題目連結：[LeetCode](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)

## 題目摘要

給定 nums 是被旋轉過的遞增序列，找出 nums 中最小的數字

## 解題思路

### 關鍵觀察

- 思考如何判斷旋轉點的位置
- 最小值就是兩段交界的旋轉點。比較 nums[mid] 和 nums[right] 可以判斷最小值在哪一側

### 演算法

1. Binary Search，縮小範圍直到 left == right
2. if 判斷 nums[mid] 是否大於 nums[right]:
3. 是的話代表右半邊有 rotate, left = mid + 1
4. 否的話代表右半邊有序 right = mid

## 複雜度

- 時間：`O(log(n))`
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
    int findMin(vector<int>& nums) {
        int n=nums.size();
        int left=0, right=n-1;

        while (left < right){
            int mid = (left+right) / 2;
            if (nums[mid] > nums[right]){
                left = mid+1;
            }
            else {
                right = mid;
            }
        }

        return nums[left];
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
