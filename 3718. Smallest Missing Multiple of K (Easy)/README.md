# 3718. Smallest Missing Multiple of K

> 難度：**Easy**
> 題型：`Hash Table`
> 題目連結：[LeetCode](https://leetcode.com/problems/smallest-missing-multiple-of-k/)

## 題目摘要

給定整數陣列 nums 以及整數 k，找出 最小的、沒有出現在 nums 裡的 k 的正倍數

Constraints:

* 1 <= nums.length <= 100
* 1 <= nums[i] <= 100
* 1 <= k <= 100

## 解題思路

### 關鍵觀察

- 觀察限制條件，nums 的元素落在有限的範圍內
- 在兩種情況下會得出結果: k 的倍數在 100 之內，但是 nums 中不存在該數字；k 的倍數超過 100

### 演算法

1. 紀錄哪些數字出現過
2. 從 k 開始依序檢查倍數
3. 如果倍數超過 100 或是 nums 中不存在該倍數，則回傳該倍數

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
    int missingMultiple(vector<int>& nums, int k) {
        int mp[101] = {0};

        for (auto n : nums){
            mp[n] = 1;
        }

        for (int mul = k; ; mul+=k){
            if (mul > 100 || !mp[mul]) return mul;
        }
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
