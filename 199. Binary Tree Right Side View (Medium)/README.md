# 199. Binary Tree Right Side View

> 難度：**Medium**
> 題型：`Breadth-First Search`
> 題目連結：[LeetCode](https://leetcode.com/problems/binary-tree-right-side-view/)

## 題目摘要

給定一棵樹的根結點 root，假想自己站在樹的右側，回傳從上到下依序可以看到的節點數值

## 解題思路

### 關鍵觀察

- 利用 BFS 一層一層處理
- 依據每層是從左到右還是從右到左 push，決定該層第一個或是最後一個處理的節點，是從右側看到的節點

### 演算法

1. BFS Level Order Traversal
2. queue 儲存每一層 (先 push 左節點，再 push 右節點)
3. 每層最後一個節點就是答案

## 複雜度

- 時間：`O(n)`
- 空間：`O(n)`

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
    vector<int> rightSideView(TreeNode* root) {
        if (!root) return {};
        vector<int> rightview;
        queue<TreeNode*> q;
        q.push(root);

        while (!q.empty()){
            int qsize = q.size();

            TreeNode * currnode;
            for (int i=0; i<qsize; i++){
                currnode = q.front();
                q.pop();
                if (currnode->left) q.push(currnode->left);
                if (currnode->right) q.push(currnode->right);
            }
            rightview.push_back(currnode->val);
        }

        return rightview;
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
