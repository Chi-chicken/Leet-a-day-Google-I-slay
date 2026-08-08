# 48. Rotate Image (Medium)

> 難度：**Medium**
> 題目連結：[LeetCode](https://leetcode.com/problems/rotate-image/)

## 題目摘要

Q: 給定一個 n x n 矩陣 matrix，試問該如何將他順時針旋轉 90 度

## 解題思路
1. 90 = transpose + reverse row
2. 180 = reverse row + reverse column
3. 270 = transpose + reverse col

## Python

```python
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        self.transpose(matrix)
        self.reverse(matrix)

    def transpose(self, matrix):
        n = len(matrix)
        for i in range(n):
            for j in range(i + 1, n):
                matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i]

    def reverse(self, matrix):
        n = len(matrix)
        for i in range(n):
            for j in range(n // 2):
                matrix[i][j], matrix[i][-j-1] = matrix[i][-j - 1], matrix[i][j]
```
Runtime: 0 ms, Memory: 18.1 mb

## C++

```c++
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int side = matrix.size();

        // Transpose
        for (int i=0; i < side; i++){
            for (int j=0; j < side; j++){
                if (i==j) break;
                else swap(matrix[i][j], matrix[j][i]);
            }
        }
        // 每個row做reverse
        for (int i=0; i < side; i++){
            reverse(matrix[i].begin(), matrix[i].end());
        }
    }
};
```

Runtime: 0 ms, Memory: 10 mb

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
