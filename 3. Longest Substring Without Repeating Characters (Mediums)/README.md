# 3. Longest Substring Without Repeating Characters

🔗 [LeetCode Link](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

## :beginner: Description

Sliding window

## :bulb: TIPS


## Python 

```python
from collections import Counter
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        chars = Counter()

        left = right = 0
        res = 0
        while right < len(s):
            r = s[right]
            chars[r] += 1
            while chars[r] > 1:
                l = s[left]
                chars[l] -= 1
                left += 1
            res = max(res, right - left +1)
            right += 1
        return res
```
Runtime: 34 ms, Memory: 14.89 mb

### Complexity Analysis

Time complexity: O(2n)=O(n) 

Space complexity: O(min(m, n)) 


## C++

```c++

```

Rumtime:  ms, Memory:  mb

