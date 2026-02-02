# 14. Longest Common Prefix 

🔗 [LeetCode Link](https://leetcode.com/problems/longest-common-prefix/)

## :beginner: Description

找出這些字串中Longest Common Prefix（最長共同前綴)，也就是從最左邊開始，所有字串都一樣的那一段字串


## :bulb: TIPS
水平掃描
1. 先假設第一個字串是 prefix
2. 依序拿 prefix 跟下一個字串比
3. 不符合就縮短 prefix
4. prefix 變空字串就直接結束

## Python 

```python
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 0:
            return ""
        prefix = strs[0]
        for i in range(1, len(strs)):
            while strs[i].find(prefix) != 0:
                prefix = prefix[0: len(prefix) - 1]
                if prefix == "":
                    return ""
        return prefix
```
Runtime: 0 ms, Memory: 19.41 mb

### Complexity Analysis

Time complexity: O(S) 所有字串的字元總數

Space complexity: O(1) 


## C++

```c++

```

Rumtime:  ms, Memory:  mb
