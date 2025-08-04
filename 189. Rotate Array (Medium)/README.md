# 189. Rotate Array

🔗 [LeetCode Link](https://leetcode.com/problems/rotate-array/)

## :beginner: Description

給定一個陣列 nums，讓它向右 rotate k 步

**TIPS:**  
1. 將整個 nums 倒轉
2. 倒轉前 k 個元素
3. 倒轉後 nums.size() - k 個元素

**Constraints:**

* 1 <= nums.length <= 10^5
* -2^31 <= nums[i] <= 2^31 - 1
* 0 <= k <= 10^5

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        k = k % nums.size();
        reverse(nums.begin(), nums.end());
        reverse(nums.begin(), nums.begin()+k);
        reverse(nums.begin()+k, nums.end());
        return;
    }
};
```
Runtime: 0 ms, Memory: 29.5 mb

