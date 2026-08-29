# 102. Binary Tree Level Order Traversal (Medium)

> 難度：**Medium**
> 題型：`Breadth-First Search`
> 題目連結：[LeetCode](https://leetcode.com/problems/binary-tree-level-order-traversal/)

## 題目摘要

經典的BFS

給你一棵二元樹，要一層一層由上到下、由左到右讀取節點的值，最後回傳一個二維陣列，每一個子陣列代表一層。

## 解題思路

每次從 queue 拿出當層所有節點，記錄它們的值，並把下一層節點加入 queue

## Python

```python
from collections import deque
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        levels = []
        if not root:
            return levels

        level = 0
        queue = deque([root,])

        while queue:
            levels.append([])
            level_len = len(queue)

            for i in range(level_len):
                node = queue.popleft()
                levels[level].append(node.val)

                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)

            level += 1

        return levels
```
Runtime: 0 ms, Memory: 20.07 mb

## 複雜度

Time complexity: O(N) 每個節點只進出 queue 一次

Space complexity: O(N) 最壞情況 queue 會存一整層的節點

## C++

```c++
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
    vector<vector<int>> levelOrder(TreeNode* root) {
        if (!root) return {};
        vector<vector<int>> traverse_rst;
        queue<TreeNode*> q;
        q.push(root);

        while (!q.empty()){
            int qsize = q.size();
            vector<int> levelval;
            for (int i=0; i<qsize; i++){
                TreeNode * currnode = q.front();
                q.pop();
                
                levelval.push_back(currnode->val);
                if (currnode->left) q.push(currnode->left);
                if (currnode->right) q.push(currnode->right);
            }
            traverse_rst.push_back(levelval);
        }
        return traverse_rst;
    }
};
```

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
