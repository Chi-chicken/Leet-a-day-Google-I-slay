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

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
