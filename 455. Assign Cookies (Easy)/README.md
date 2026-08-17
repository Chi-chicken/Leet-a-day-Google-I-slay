# 455. Assign Cookies

> 難度：**Easy**
> 題型：`Greedy`, `Two Pointers`
> 題目連結：[LeetCode](https://leetcode.com/problems/assign-cookies/)

## 題目摘要

給定每個小孩有一個 greed factor g[i]，代表能夠滿足他的餅乾最小尺寸，家長擁有的餅乾尺寸用 s[j] 代表，如果 s[j] >= g[i] 則該小孩能夠被滿足，試問家長最多可以滿足幾位小孩?

## 解題思路

### 關鍵觀察

- 用能滿足某個小孩的最小餅乾去滿足他，把大餅乾留給胃口更大的小孩
- 因此需要對小孩的 greed factor 以及餅乾的尺寸排序

### 演算法

1. 對 greed factor 和 cookie size 做排序
2. While loop，用雙指標從最小開始配對
3. 對目前胃口最小的小孩，使用能滿足他的最小餅乾，這樣可以保留較大的餅乾給之後胃口較大的小孩

## 複雜度

- 時間：`O(m log m + n log n)`
- 空間：`O(log m + log n)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
public:
    int findContentChildren(vector<int>& g, vector<int>& s) {
        sort(g.begin(), g.end());
        sort(s.begin(), s.end());
        int child_idx=0, cookie_idx=0;
        while (child_idx < g.size() && cookie_idx < s.size()){
            if (s[cookie_idx] >= g[child_idx]){
                child_idx++;
            }
            cookie_idx++;
        }
        
        return child_idx;
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
