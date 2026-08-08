# 3. Longest Substring Without Repeating Characters

> 難度：**Medium**
> 題目連結：[LeetCode](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

## 題目摘要

Sliding window

## 解題思路

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

## 複雜度

Time complexity: O(2n)=O(n)

Space complexity: O(min(m, n))

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
