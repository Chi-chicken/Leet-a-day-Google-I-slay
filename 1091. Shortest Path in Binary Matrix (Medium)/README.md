# 1091. Shortest Path in Binary Matrix

🔗 [LeetCode Link](https://leetcode.com/problems/shortest-path-in-binary-matrix/)

## :beginner: Description

給定一 n x n 矩陣 grid，內部元素中 0 代表可以走的路徑、1 代表不能走的路徑，
求從起點 grid[0][0] 移動至終點 grid[n-1][n-1] 的最短路徑，若無法走至終點，則回傳 -1

註: 
1. 起點或終點可能為 1，則直接回傳 -1
2. 走路的方向可為垂直、水平、對角線共八個方位

**TIPS:**  
使用廣度優先搜索，廣度優先搜索 (BFS, Breadth-First Search) 演算法是一種用來遍歷圖或樹的演算法，
特點是「一層一層往外擴展節點」，適合用在尋找最短路徑的問題。實現方法:
1. 創建一 queue: 用來保存下一步要擴展的節點
2. 從起點開始: 先將起點放入 queue
3. 每次從 queue 取出一個節點，將它所有「尚未拜訪」的鄰居節點放入 queue 中
4. 標記已拜訪節點: 避免重複訪問 (可在資料結構中標記)
5. 重複以上過程直到找到目標或 queue 為空

ANS: 透過上述 BFS 方法找尋 grid 中的最短路徑，並在每個遍歷過的路徑中記錄下 timestamp，便可知道走到特定位置所花費的步數

**Constraints:**

* n == grid.length
* n == grid[i].length
* 1 <= n <= 100
* grid[i][j] is 0 or 1

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    int dx[8] = {-1, -1, -1, 0, 1, 1, 1, 0};
    int dy[8] = {-1, 0, 1, 1, 1, 0, -1, -1};

    int shortestPathBinaryMatrix(vector<vector<int>>& grid) {
        int n = grid.size()-1;
        queue<pair<int, int>> pathQueue;

        if (grid[0][0] != 0 || grid[n][n] != 0) return -1;

        grid[0][0] = 1;
        pathQueue.push({0, 0});

        while(!pathQueue.empty()){
            auto [currX, currY] = pathQueue.front();
            int currDist = grid[currX][currY];
            pathQueue.pop();

            if (currX == n && currY == n) return currDist;
            
            for (int i=0; i<8; i++){
                int nextX = currX + dx[i];
                int nextY = currY + dy[i];
                if (nextX < 0 || nextY < 0 || nextX > n || nextY > n){
                    continue;
                }
                else if (grid[nextX][nextY] == 0){
                    grid[nextX][nextY] = currDist + 1;
                    pathQueue.push({nextX, nextY});
                }
            }
        }
        return -1;
    }
};
```
Runtime: 13 ms, Memory: 23.4 mb
