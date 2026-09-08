# 733. Flood Fill

> 難度：**Easy**
> 題型：`Depth-First Search`, `Breadth-First Search`
> 題目連結：[LeetCode](https://leetcode.com/problems/flood-fill/)

## 題目摘要

給定以下輸入：

1. 一個 `m x n` 矩陣 `image`，裡面的元素大小代表顏色
2. `int` 變數 `sr, sc` 代表起點位置 start row, start col
3. `int` 變數 `color` 代表要新填入的顏色

試將 `image` 內「與起點顏色相同」，且「位置相鄰」的元素填上新顏色 `color`。

（位置相鄰代表目前位置的垂直、水平四個方位相鄰元素）

### TIPS

1. 記錄起點位置的顏色 `image[sr][sc]`
2. 利用 BFS 從 `sr, sc` 開始遍歷 `image` (參照 Q. 1091)，只要當下元素顏色與起點位置顏色相同，則將它改成新顏色。遍歷直至 BFS `queue` 為空
3. 注意在 `push` 進 `queue` 時就改顏色，而不是 `pop` 出來時才改，可以避免同一個格子被重複加入 `queue`。

### Constraints

- `m == image.length`
- `n == image[i].length`
- `1 <= m, n <= 50`
- `0 <= image[i][j], color < 2^16`
- `0 <= sr < m`
- `0 <= sc < n`

## 複雜度

- 時間：`O(m × n)`
- 空間：`O(m × n)`

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
private:
    int row[4] = {1, 0, -1, 0};
    int col[4] = {0, -1, 0, 1};
public:
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int color) {
        int m = image.size();
        int n = image[0].size();
        int base = image[sr][sc];
        if (base == color) return image;

        queue<pair<int, int>> q;
        image[sr][sc] = color;
        q.push({sr, sc});

        while(!q.empty()){
            pair<int, int> cur_pos = q.front();
            int cursr = cur_pos.first;
            int cursc = cur_pos.second;
            q.pop();

            for (int i=0; i<4; i++){
                int nextsr = cursr + row[i];
                int nextsc = cursc + col[i];
                if (nextsr >= 0 && nextsr < m && nextsc >=0 && nextsc < n && image[nextsr][nextsc] == base) {
                    image[nextsr][nextsc] = color;
                    q.push({nextsr, nextsc});
                }
            }
        }

        return image;
    }
};
```

Runtime: 0 ms, Memory: 18.24 mb

## 討論與補充

### 模板

```c++
queue<pair<int, int>> q;

q.push({x, y});

while (!q.empty()) {
    auto [x, y] = q.front();
    q.pop();

    // process
}
```

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
