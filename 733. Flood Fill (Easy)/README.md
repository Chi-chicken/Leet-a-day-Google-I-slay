# 733. Flood Fill

> 難度：**Easy**  \n> 題目連結：[LeetCode](https://leetcode.com/problems/flood-fill/)

🔗 [LeetCode Link](https://leetcode.com/problems/flood-fill/description/)

## 題目摘要

給定以下輸入:
1. 一個 m x n 矩陣 image，裡面的元素大小代表顏色
2. int 變數 sr, sc 代表起點位置 start row, start col
3. int 變數 color 代表要新填入的顏色

試將 image 內「與起點顏色相同」，且「位置相鄰」的元素填上新顏色 color。
(位置相鄰代表目前位置的垂直、水平四個方位相鄰元素)

**TIPS:**
1. 記錄起點位置的顏色 image[sr][sc]
2. 利用 BFS 從 sr, sc 開始遍歷 image (參照 Q. 1091)，只要當下元素顏色與起點位置顏色相同，則將它改成新顏色。遍歷直至 BFS queue 為空

**Constraints:**

* m == image.length
* n == image[i].length
* 1 <= m, n <= 50
* 0 <= image[i][j], color < 2^16
* 0 <= sr < m
* 0 <= sc < n

## Python

```python
class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, newColor: int) -> List[List[int]]:
        # DFS
        R, C = len(image), len(image[0])
        color = image[sr][sc]
        if color == newColor:
            return image
        def dfs(r, c):
            if image[r][c] == color:
                image[r][c] = newColor
                if r >= 1:  # up
                    dfs(r-1, c)
                if r + 1 < R:  # down
                    dfs(r + 1, c)
                if c >= 1:  # left
                    dfs(r, c - 1)
                if c + 1 < C:  # right
                    dfs(r, c + 1)

        dfs(sr, sc)
        return image
```
Runtime: 0 ms, Memory: 17.9 mb

## C++

```c++
class Solution {
public:
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int color) {
        int dx[4] = {0, 0, 1, -1};
        int dy[4] = {1, -1, 0, 0};
        int m = image.size();
        int n = image[0].size();
        int colorOld = image[sr][sc];
        if (colorOld == color) return image;
        queue<pair<int, int>> color_q;

        color_q.push({sr, sc});

        while(!color_q.empty()){
            auto [row, col] = color_q.front();
            color_q.pop();
            // 填上新顏色
            image[row][col] = color;

            for (int i=0; i<4; i++){
                int rowNext = row + dx[i];
                int colNext = col + dy[i];
                // 在 image 範圍內，且顏色為舊顏色，則 push 至 queue 中
                if (rowNext >=0 && colNext >= 0 &&
                    rowNext < m && colNext < n &&
                    image[rowNext][colNext] == colorOld){
                    color_q.push({rowNext, colNext});
                }
            }
        }
        return image;
    }
};
```
Runtime: 0 ms, Memory: 18.24 mb

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
