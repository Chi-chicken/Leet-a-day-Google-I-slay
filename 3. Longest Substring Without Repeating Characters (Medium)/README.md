# 3. Longest Substring Without Repeating Characters

> 難度：**Medium**
> 題型：`Hash Table`, `Sliding Window`
> 題目連結：[LeetCode](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

## 題目摘要

給定字串 s，找到沒有重複字元的最長子串長度

## 解題思路

### 關鍵觀察

- Hash map 紀錄字元出現的最後位置
- Sliding Window 的 invariant (不變條件): 在每一輪處理完成後，s[head...i] 一定是不包含重複字元的合法 substring。
- head 紀錄目前合法子字串開頭位置，且只能向右移

### 演算法

1. 建立 hash map 紀錄字串中的字元及其索引配對；並以 head 紀錄子字串開頭位置
2. 跑 For 迴圈走過 s 中所有字元，時刻紀錄並比較合法子字串長度
2. 過程中如果當下字元符合條件: 以前出現過而且那一次出現的位置仍然在「目前 window 裡」，則更新 head

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

```cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        vector<int> mp(256, -1);
        int head = 0;
        int maxlen = 0;

        for (int i=0; i<s.size(); i++){
            unsigned int character = s[i];
            if (mp[character] >= head){
                head = mp[character] + 1;
            }
            mp[character] = i;
            maxlen = max(maxlen, i-head+1);
        }
        return maxlen;
    }
};
```

## 複雜度

Time complexity: O(n)

Space complexity: O(1) 不論字串長度都只使用 256 個 int

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}
- 一般 ASCII 字元可以用一個 byte 表示，所以宣告 256 個元素則可以涵蓋一個 unsigned char 所有可能的 byte 值
 - 只有 a-z          → 26
 - ASCII             → 128
 - 任意 byte/char    → 256

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
