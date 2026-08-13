# 1161. Maximum Level Sum of a Binary Tree

> 難度：**Medium**
> 題型：`Tree`, `Breadth-First Search`
> 題目連結：[LeetCode](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/)

## 題目摘要

給定一棵二元樹的根節點 `root`，根節點位於第 `1` 層，其子節點位於第 `2` 層，以此類推。

計算每一層所有節點的總和，回傳總和最大的層數；如果有多層的總和相同，回傳其中最小的層數。

## 解題思路

### 關鍵觀察

- 哪種搜尋方法更有利於一層一層計算總和
- 看到題目在探討樹的同一層深度 (每一層、level、同一深度等字樣) 想到 BFS
   - BFS (Breadth First Search) 像水波般一層層向外擴散，使用佇列（Queue）並能找出最短路徑；
   - DFS (Depth First Search) 則是先將單一道路走到底，遇到死路再回頭，使用堆疊（Stack）或遞迴。

### 演算法

1. BFS 基本模板:
```cpp
queue<TreeNode*> q;
q.push(root);

while (!q.empty()) {
    TreeNode* node = q.front();
    q.pop();

    // 處理 node

    if (node->left)
        q.push(node->left);

    if (node->right)
        q.push(node->right);
}
```
2. 每處理完一層，比較該層是否有最大加總

## 複雜度

- 時間：`O(n)`
- 空間：`O(w)`，其中 `w` 是二元樹的最大寬度；最壞情況為 `O(n)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int maxLevelSum(TreeNode* root) {
        int maxSum = INT_MIN;
        int minLev = 0;
        int level = 1;
        queue<TreeNode*> q;

        q.push(root);
        while (!q.empty()) {
            int levelSize = q.size();
            int levelSum = 0;

            for (int i = 0; i < levelSize; i++) {
                TreeNode* node = q.front();
                q.pop();

                levelSum += node->val;
                if (node->left) q.push(node->left);
                if (node->right) q.push(node->right);
            }

            if (levelSum > maxSum) {
                maxSum = levelSum;
                minLev = level;
            }

            level++;
        }

        return minLev;
    }
};
```

## 邊界條件與筆記

### `std::queue` 常用操作

| 操作 | 說明 | 時間複雜度 |
|---|---|:---:|
| `push(x)` | 將元素加入佇列尾端 | `O(1)` |
| `pop()` | 移除佇列最前方的元素，不回傳該元素 | `O(1)` |
| **`front()`** | **取得最早加入、下一個要被移除的元素** | **`O(1)`** |
| **`back()`** | **取得最近加入、位於佇列尾端的元素** | **`O(1)`** |
| `empty()` | 判斷佇列是否為空 | `O(1)` |
| `size()` | 取得佇列目前的元素數量 | `O(1)` |

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
