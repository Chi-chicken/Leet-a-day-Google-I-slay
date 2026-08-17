# 3702. Longest Subsequence With Non-Zero Bitwise XOR

> 難度：**Medium**
> 題型：`Bit Manipulation`
> 題目連結：[LeetCode](https://leetcode.com/problems/longest-subsequence-with-non-zero-bitwise-xor/)

## 題目摘要

給定一個整數陣列 nums，可以從 nums 中選擇一些元素組成子陣列 subsequence，回傳 subsequence 可能的最長長度滿足裡面的所有元素做 bitwise XOR 不為 0，如果沒有該子陣列存在，則回傳 0。

## 解題思路

### 關鍵觀察

- Subsequence 定義: A subsequence is an non-empty array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.
- 只要 nums 中有非 0 的元素，則將該元素剔除，剩下的元素做 bitwise XOR 則不會為 0
- 這題不是「怎麼找 longest subsequence」，而是先觀察: 答案其實只可能是 n、n-1、0。

### 演算法

1. For Loop 跑過 nums 中所有元素，記錄每個元素的 bitwise XOR 結果，同時記錄陣列中是否存在非零元素。
2. 如果跑完之後結果不為 0，則整個陣列本身就是合法的 subsequence，回傳 nums 的尺寸
3. 如果跑完之後結果為 0 但存在非零元素，移除任意一個非零元素 x 後，剩餘元素 XOR 為 0 ^ x = x，則回傳 nums-1
4. 排除掉前面兩個條件，剩下的只有 nums 全為 0，因此回傳 0

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
    int longestSubsequence(vector<int>& nums) {
        int n = nums.size();
        int xor_rst = 0;
        bool hasNoneZero = false;

        for (int i=0; i<n; i++){
            if (nums[i] != 0) hasNoneZero = true;
            xor_rst ^= nums[i];
        }

        if (xor_rst) return n;
        else if (hasNoneZero) return n-1;
        return 0;
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
