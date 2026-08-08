# 735. Asteroid Collision

> 難度：**Medium**
> 題目連結：[LeetCode](https://leetcode.com/problems/asteroid-collision/)

## 題目摘要

給定一個陣列 asteroids，裡面的正數代表往右飛的小行星、負數代表往左飛的小行星，
數字的大小(取絕對值)代表行星的大小。當向右的小行星和向左的小行星進行碰撞，
會留下絕對值較大的小行星，如果數字相當，則兩個行星皆會消失。
試問會留下來的行星陣列?

**TIPS:**
使用 stack 暫存小行星的狀態

ANS:
1. 建立一個 stack 暫存小行星的狀態
2. 從 asteroids 最後一個元素向前遍歷小行星陣列：
   - 若 stack 為空、或是 stack.top() 亦為正，表示不會發生碰撞，直接 push
   - 若 stack.top() 為負且絕對值大於當下小行星：當下小行星消失
   - 若 stack.top() 為負且絕對值等於當下小行星：雙方皆消失
   - 若 stack.top() 為負且絕對值小於當下小行星：stack.top() 消失
   - 若當下小行星為負，則直接 push 進 stack
3. 最後將 stack 中剩餘元素輸出為 vector（注意順序反轉）

**Constraints:**

* 2 <= asteroids.length <= 10^4
* -1000 <= asteroids[i] <= 1000
* asteroids[i] != 0

## Python

```python
class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        stack = []

        for a in asteroids:
            while stack and a < 0 < stack[-1]:
                if stack[-1] < -a:
                    stack.pop()
                    continue
                elif stack[-1] == -a:
                    stack.pop()
                break
            else:
                stack.append(a)

        return stack
```
Runtime: 7 ms, Memory: 18.9 mb

## C++

```c++
class Solution {
public:
    vector<int> asteroidCollision(vector<int>& asteroids) {
        stack<int> survived_atd;
        int a_idx = asteroids.size() - 1;
        while (a_idx >= 0){
            if (asteroids[a_idx] > 0){
                if (survived_atd.empty() || survived_atd.top() > 0){
                    survived_atd.push(asteroids[a_idx]);
                    a_idx--;
                }
                else if (abs(survived_atd.top()) > asteroids[a_idx]) {
                    a_idx--;
                }
                else if (abs(survived_atd.top()) == asteroids[a_idx]){
                    survived_atd.pop();
                    a_idx--;
                }
                else {
                    survived_atd.pop();
                }
            }
            else {
                survived_atd.push(asteroids[a_idx]);
                a_idx--;
            }
        }

        vector<int> output;
        while (!survived_atd.empty()){
            output.push_back(survived_atd.top());
            survived_atd.pop();
        }
        return output;
    }
};
```
Runtime: 0 ms, Memory: 22.15 mb

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
