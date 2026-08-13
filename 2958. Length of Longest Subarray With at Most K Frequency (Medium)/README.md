# 2958. Length of Longest Subarray With at Most K Frequency

> 難度：**Medium**
> 題型：`Hash Table`, `Sliding Window`
> 題目連結：[LeetCode](https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency/)

## 題目摘要

給定一個整數陣列 nums 以及整數 k 代表頻率，回傳最大子陣列長度滿足該子陣列內每個元素數目不大於 k

## 解題思路

### 關鍵觀察

- 右邊探索，左邊修正，維持 window 合法 (沒有任何一個元素出現次數超過 k)
- 在加入 nums[tail] 之前 window 已經合法，因此新一輪唯一可能違規的，就是剛加入的 nums[tail]。

### 演算法

1. 創建 hash map 紀錄每個元素在合法子陣列中的出現頻率；創建變數 head 紀錄合法的子陣列開頭索引
2. For 迴圈跑過 nums，如果加入當下索引的元素，該元素數目會超過頻率 k，則將 head 向右移動並不停把左邊的元素移出去，直至當下索引指向的元素數目小於等於 k
3. 時刻紀錄並比較合法子陣列的長度

## 複雜度

- 時間：`O(n)`
- 空間：`O(n)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    int maxSubarrayLength(vector<int>& nums, int k) {
        unordered_map<int, int> mp;
        int maxlen=0;
        int head=0;

        for (int tail=0; tail<nums.size(); tail++){
            mp[nums[tail]]++;
    
            while (mp[nums[tail]] > k){
                mp[nums[head]]--;
                head++;
            }
            maxlen=max(maxlen, tail - head + 1);
        }
        return maxlen;
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
