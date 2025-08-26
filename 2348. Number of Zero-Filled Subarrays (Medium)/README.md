# 2348. Number of Zero-Filled Subarrays (Medium)

🔗 [LeetCode Link](https://leetcode.com/problems/number-of-zero-filled-subarrays/)

## :beginner: Description

Q: 給定一個數列 nums，回傳nums內元素全部為0的子陣列數目

## :bulb: TIPS
[0陣列] -> 能形成的子陣列數目
1. [0] -> 1
2. [0, 0] -> 1+2
3. [0, 0, 0] -> 1+2+3

## Python 

```python

```
Runtime: ms, Memory: mb

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
