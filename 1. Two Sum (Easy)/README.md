# 1. Two Sum

> 難度：**Easy**
> 題型：`Hash Table`
> 題目連結：[LeetCode](https://leetcode.com/problems/two-sum/)

## 題目摘要

給定整數陣列 nums 以及 target，找出 nums 中哪兩個數字相加為 target，回傳那兩個數字的 index
- 只有唯一解

## 解題思路

### 關鍵觀察

- 如何實現 O(n) 的解法
- nums[i] + nums[j] = target 轉換成 nums[j] = target - nums[i]
- 當我看到 nums[i] 時，之前有沒有出現過 target - nums[i]?

### 演算法

1. 創建一 hash map 放數字和其索引
2. 跑 For 迴圈，找當下數字的互補數是否存在於 map 之中，如果有的話回傳兩個數字的索引
3. 否則，將當下數字和其索引存入 map 當中

## 複雜度

- 時間：`O(n)` 單次遍歷，每次查找/插入平均 O(1)
- 空間：`O(n)` 儲存 hash map 最壞情況，map 會存放所有數字

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int>mp;
        for(int i=0; i<nums.size(); i++) {
            if(mp.find(target - nums[i]) != mp.end()) {
                return {i, mp[target-nums[i]]};
            }
            mp[nums[i]] = i;
        }
        return {};
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}
- mp.find(key) != mp.end() 確認 key 是否已經存入 mp

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
