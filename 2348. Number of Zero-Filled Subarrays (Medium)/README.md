# 2348. Number of Zero-Filled Subarrays (Medium)

> 難度：**Medium**
> 題目連結：[LeetCode](https://leetcode.com/problems/number-of-zero-filled-subarrays/)

## 題目摘要

Q: 給定一個數列 nums，回傳nums內元素全部為0的子陣列數目

## 解題思路
[0陣列] -> 能形成的子陣列數目
1. [0] -> 1
2. [0, 0] -> 1+2
3. [0, 0, 0] -> 1+2+3

## Python

```python
class Solution:
    def zeroFilledSubarray(self, nums: List[int]) -> int:
        ans, num_subarray = 0, 0

        for num in nums:
            if num == 0:
                num_subarray += 1
            else:
                num_subarray = 0
            ans += num_subarray

        return ans

```
Runtime: 32 ms, Memory: 28.4 mb

## C++

```c++
class Solution {
public:
    long long zeroFilledSubarray(vector<int>& nums) {
        long long ans = 0, cnt = 0;
        for (int num : nums){
            if (num == 0){
                cnt++;
                ans += cnt;
            }
            else cnt = 0;
        }
        return ans;
    }
};
```
Runtime: 0 ms, Memory: 111.22 mb

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
