# 200. Number of Islands

> 難度：**Medium**
> 題目連結：[LeetCode](https://leetcode.com/problems/number-of-islands/)

## 題目摘要

BFS!!!

給定一個 2D grid，由 "1"（陸地）與 "0"（水）組成
Island（島嶼） 的定義是：
由 上下左右（4-direction） 相連的 "1" 所構成(對角線不算)，計算 grid 中有幾個島嶼。

## 解題思路
每次從 queue 拿出當層所有節點，記錄它們的值，並把下一層節點加入 queue

## Python

```python
from collections import deque
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:

        if not grid:
            return 0

        nrow = len(grid)
        ncol = len(grid[0])
        num_islands = 0

        for r in range(nrow):
            for c in range(ncol):
                if grid[r][c] == "1":
                    num_islands += 1
                    grid[r][c] = "0" # mark as visited
                    neighbors = deque()
                    neighbors.append((r, c))
                    while neighbors:
                        row, col = neighbors.popleft()
                        if row - 1 >= 0 and grid[row - 1][col] == "1":
                            neighbors.append((row - 1, col))
                            grid[row - 1][col] = "0"
                        if row + 1 < nrow and grid[row + 1][col] == "1":
                            neighbors.append((row + 1, col))
                            grid[row + 1][col] = "0"
                        if col - 1 >= 0 and grid[row][col - 1] == "1":
                            neighbors.append((row, col - 1))
                            grid[row][col - 1] = "0"
                        if col + 1 < ncol and grid[row][col + 1] == "1":
                            neighbors.append((row, col + 1))
                            grid[row][col + 1] = "0"
        return num_islands
```
Runtime: 223 ms, Memory: 21.9 mb

## 複雜度

Time complexity: O(MN) Grid大小

Space complexity: O(MN) 最壞情況 整張都是島("1")

## C++

```c++

```

Rumtime:  ms, Memory:  mb

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
