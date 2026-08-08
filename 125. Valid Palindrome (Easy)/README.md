# 125. Valid Palindrome

> 難度：**Easy**  \n> 題目連結：[LeetCode](https://leetcode.com/problems/valid-palindrome/)

🔗 [LeetCode Link](https://leetcode.com/problems/valid-palindrome/)

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

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
