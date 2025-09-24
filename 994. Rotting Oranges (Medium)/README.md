# 994. Rotting Oranges (Medium)

🔗 [LeetCode Link](https://leetcode.com/problems/rotting-oranges/)

## :beginner: Description

Q: 壞橘子爛了整欄橘  
傳入一個m x n 二維陣列，內部元素 0 代表空、1為新鮮橘、2為爛橘。  
每過一個時間點與爛橘子相鄰的新鮮橘會爛掉 (四個方位)，試問最少過了幾個時間點所有橘子都會爛掉?  
若所有橘子都爛掉回傳該時間點，若有新鮮橘殘留則回傳 -1  

## :bulb: TIPS
我們需要額外初始化一個一樣大小的二維陣列紀錄每輪橘子爛掉的timestamp所以在做 DFS 時，我們需要隨時更新:  
1. grid - 負責記錄橘子的狀態 (新鮮與否)  
2. gridTime - 負責記錄橘子是在第幾個time stamp被腐化  

*註: 一開始在尋找爛橘子作為DFS的起點時，順便紀錄新鮮橘的數量，以在最後判斷橘子是否全部被腐化完。在做DFS的過程中，也要隨時記錄爛橘數目。  

## Python 

```python
from collections import deque
class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        queue = deque()

        fresh_o = 0
        ROWS, COLS = len(grid), len(grid[0])
        for r in range(ROWS):
            for c in range(COLS):
                if grid[r][c] == 2:
                    queue.append((r, c))
                elif grid[r][c] == 1:
                    fresh_o += 1

        queue.append((-1, -1))

        # Rotten process via BFS
        minutes = -1
        directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        while queue:
            row, col = queue.popleft()
            if row == -1:
                minutes += 1
                if queue:
                    queue.append((-1, -1))
            else:
                for d in directions:
                    neighbor_row, neighbor_col = row + d[0], col + d[1]
                    if ROWS > neighbor_row >= 0 and COLS > neighbor_col >= 0:
                        if grid[neighbor_row][neighbor_col] == 1:
                            grid[neighbor_row][neighbor_col] = 2
                            fresh_o -= 1
                            queue.append((neighbor_row, neighbor_col))

        return minutes if fresh_o == 0 else -1
```
Runtime: 4 ms, Memory: 17.8 mb

## C++

```c++
class Solution {
public:
    int orangesRotting(vector<vector<int>>& grid) {
        int dx[4] = {0, 0, 1, -1};
        int dy[4] = {1, -1, 0, 0};
        int m = grid.size();
        int n = grid[0].size();
        // freshOrange: 紀錄初始狀態的新鮮橘子; rotOrange: 紀錄最後被腐爛的橘子總數 (用來確認有沒有新鮮遺漏)
        int freshOrange = 0, rotOrange = 0;
        queue<pair<int, int>> q;
        // timeMax: 紀錄最大的 timestamp; gridTime: 用來記錄所有橘子的 timestamp 狀態
        int timeMax = 0;
        vector<vector<int>> gridTime(m, vector<int>(n, 0));

        // 1. 找到腐爛橘子，push至q中。 2. 計算原本有的新鮮橘子數量
        for (int i=0; i<m; i++){
            for (int j=0; j<n; j++){
                if (grid[i][j] == 2) q.push({i, j});
                else if (grid[i][j] == 1) freshOrange++;
            }
        }

        // 開始 DFS
        while (!q.empty()){
            auto [currX, currY] = q.front();
            q.pop();
            for (int i=0; i<4; i++){
                int nextX = currX + dx[i];
                int nextY = currY + dy[i];
                // 如果在邊界內，且為新鮮橘子，就腐爛他
                if (nextX >= 0 && nextY >= 0 && nextX < m && nextY < n && grid[nextX][nextY] == 1){
                    q.push({nextX, nextY}); // 下個腐爛橘子位置 push 至 q 中
                    grid[nextX][nextY] = 2; // 將新鮮橘狀態改為腐爛橘
                    int timeTemp = gridTime[currX][currY] + 1; // 計算被腐爛橘子的 timestamp
                    gridTime[nextX][nextY] = timeTemp; // 紀錄被腐爛橘子的 timestamp 至 gridTime
                    rotOrange++; // 被腐爛的橘子數量 ++ 
                    if (timeTemp >= timeMax) timeMax = timeTemp; // 判斷是否為最大 timestamp
                }
            }
        }

        if (freshOrange != rotOrange) return -1;
        return timeMax;
    }
};
```

Rumtime: 0 ms, Memory: 17.2 mb
