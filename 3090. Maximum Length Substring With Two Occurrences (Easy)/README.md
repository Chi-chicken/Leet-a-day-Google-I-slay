# 3090. Maximum Length Substring With Two Occurrences

> 難度：**Easy**
> 題型：`Sliding Window`
> 題目連結：[LeetCode](https://leetcode.com/problems/maximum-length-substring-with-two-occurrences/)

## 題目摘要

給定字串 s，回傳子字串的最大長度，該子字串滿足最多只包含兩個重複的字元。
s 中只包含小寫英文字母

## 解題思路

### 關鍵觀察

- Sliding window 題目中，每一步的 window 都要是合法的
- 因此每加入一個新元素之後，只需要處理由這個新元素造成的 violation，因為舊 window 原本是合法的

### 演算法

1. 使用 Sliding Window 維護目前合法的子字串，並用陣列記錄每個字元在視窗中的出現次數。右指標持續擴張；若新加入的字元出現超過 2 次，就移動左指標並減少對應計數，直到視窗重新合法。每次更新合法視窗的最大長度。
- The same problem: [2958. Length of Longest Subarray With at Most K Frequency](<../2958. Length of Longest Subarray With at Most K Frequency (Medium)/README.md>) (just K = 2)

## 複雜度

- 時間：`O(n)`
- 空間：`O(1)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    int maximumLengthSubstring(string s) {
        int mp[26] = {};
        int left = 0;
        int maxlen = 0;
        for (int i=0; i<s.size(); i++){
            const char c = s[i] - 'a';
            mp[c]++;
            while (mp[c] > 2){
                mp[s[left] - 'a']--;
                left++;
            }
            maxlen = max(maxlen, i-left+1);
        }
        return maxlen;
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
