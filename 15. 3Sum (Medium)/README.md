# 15. 3Sum

🔗 [LeetCode Link](https://leetcode.com/problems/3sum/)

## :beginner: Description

經典的BFS

3數相加=0

## :bulb: TIPS
簡單來說只是把167題變成三個數相加而已，所以完全可以繼續用two pointers，把其中一個數字固定，再利用two pointers去找有沒有三數相+會等於0的nums[lo]跟nums[hi]
首先，把數列sort過會簡單很多，固定住個數字也只要找<0的就好，因為如果三數都大於0就不可能加起來是0了
接著，把固定好的數字跟pointer需要用到的i放進去twoSumII就好了！
要小心的是，twoSumII這個function最後要記得判斷不要有重複的數字~

## Python 

```python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = []
        nums.sort()
        for i in range(len(nums)):
            if nums[i] > 0:  # 後面不可能有三數之和為0
                break
            if i == 0 or nums[i - 1] != nums[i]:
                self.twoSumII(nums, i, res)
        return res

    def twoSumII(self, nums: List[int], i: int, res: List[int]):
        lo, hi = i + 1, len(nums) - 1
        while lo < hi:
            sum = nums[i] + nums[lo] + nums[hi]
            if sum < 0:
                lo += 1
            elif sum > 0:
                hi -= 1
            else:
                res.append([nums[i], nums[lo], nums[hi]])
                lo += 1
                hi -= 1
                while lo < hi and nums[lo] == nums[lo - 1]:  # 跳過重複的第二個數字
                    lo += 1
```
Runtime: 433 ms, Memory: 20.6 mb

### Complexity Analysis

Time complexity: O(n^2)

Space complexity: O(logn)~O(n)


## C++

```c++

```

Rumtime:  ms, Memory:  mb

