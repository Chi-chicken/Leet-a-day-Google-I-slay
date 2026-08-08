# 125. Valid Palindrome

> 難度：**Easy**
> 題目連結：[LeetCode](https://leetcode.com/problems/valid-palindrome/)

## 題目摘要

忽略非英數字元（字母、數字以外的都不算），忽略大小寫，判斷字串是否為回文。

## 解題思路
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

## 複雜度

Time complexity: O(n)

Space complexity: O(1)

## C++

```c++

```

Rumtime:  ms, Memory:  mb

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
