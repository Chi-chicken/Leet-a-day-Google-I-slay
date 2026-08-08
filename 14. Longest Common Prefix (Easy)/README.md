# 14. Longest Common Prefix

> 難度：**Easy**
> 題目連結：[LeetCode](https://leetcode.com/problems/longest-common-prefix/)

## 題目摘要

找出這些字串中Longest Common Prefix（最長共同前綴)，也就是從最左邊開始，所有字串都一樣的那一段字串

## 解題思路
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

## 複雜度

Time complexity: O(S) 所有字串的字元總數

Space complexity: O(1)

## C++

```c++

```

Rumtime:  ms, Memory:  mb

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
