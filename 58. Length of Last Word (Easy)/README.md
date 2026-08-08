# 58. Length of Last Word

> 難度：**Easy**  \n> 題目連結：[LeetCode](https://leetcode.com/problems/length-of-last-word/)

## 題目摘要

Given a string `s` consisting of words and spaces, return _the length of the **last** word in the string._

A **word** is a maximal substring consisting of non-space characters only.


**Example 1:**

>**Input:** `s = "Hello World"`
>
>**Output:** `5`
>
>**Explanation:** The last word is "World" with length 5.




**Example 2:**

>**Input:** `s = "   fly me   to   the moon  "`
>
>**Output:** `4`
>
>**Explanation:** The last word is "moon" with length 4.



**Example 3:**

>**Input:** `s = "luffy is still joyboy"`
>
>**Output:** `6`
>
>**Explanation:** The last word is "joyboy" with length 6.


**Constraints:**

*   `1 <= s.length <= 104`
*   `s` consists of only English letters and spaces `' '`.
*   There will be at least one word in `s`.

## Python

感覺用Python的話不難~因為str直接使用split就會變成list了，然後就可以return最後一個字

```python
## By chi
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        s_list = s.split()

        return len(s_list[-1])
```
Runtime: 0ms, Memory:...mb

然後分享一下教科書級別的答案

```python
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        p, length = len(s), 0

        while p > 0:
            p -= 1
            # we're in the middle of the last word
            if s[p] != " ":
                length += 1
            # here is the end of last word
            elif length > 0:
                return length

        return length
```
## C++

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
