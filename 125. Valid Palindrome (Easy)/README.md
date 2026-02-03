# 125. Valid Palindrome

🔗 [LeetCode Link](https://leetcode.com/problems/valid-palindrome/)

## :beginner: Description

忽略非英數字元（字母、數字以外的都不算），忽略大小寫，判斷字串是否為回文。


## :bulb: TIPS
Two pointers

## Python 

```python
class Solution:
    def isPalindrome(self, s: str) -> bool:

        i = 0
        j = len(s) - 1

        while i < j:
            while i < j and not s[i].isalnum():
                i += 1
            while i < j and not s[j].isalnum():
                j -= 1
            if s[i].lower() != s[j].lower():
                return False
            i += 1
            j -= 1
        return True
```
Runtime: 8 ms, Memory: 19.7 mb

### Complexity Analysis

Time complexity: O(n)

Space complexity: O(1)


## C++

```c++

```

Rumtime:  ms, Memory:  mb
