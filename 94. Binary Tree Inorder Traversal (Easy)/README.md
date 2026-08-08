# 94. Binary Tree Inorder Traversal

> 難度：**Easy**  \n> 題目連結：[LeetCode](https://leetcode.com/problems/binary-tree-inorder-traversal/)

🔗 [LeetCode Link](https://leetcode.com/problems/binary-tree-inorder-traversal/description/)

## 題目摘要

給定一個 TreeNode *root，利用不同方法進行 Tree Traversal

**TIPS:**
不同 Tree Traversal 種類的順序表示的是 "根" 出現的時機點:

1. In-order Traversal (中序遍歷): 先拜訪左子樹 → 打印根結點 → 拜訪右子樹
   *注意: 在 Binary Search Tree (BST) 中使用 In-order Traversal 可以得到排序好的結果!*

2. Pre-order Traversal (前序遍歷): 先打印根結點 → 拜訪左子樹 → 拜訪右子樹
   *注意: 因為會慢慢從 Root 走向 Leafs，所以適合用來創建或複製一棵樹!*

3. Post-order Traversal (後序遍歷): 先拜訪左子樹 → 拜訪右子樹 → 打印根結點
   *注意: 由於按照 Post-order 會先走到各個 Leaf nodes，所以適合在釋放整棵樹的時候使用!*

**Constraints:**
* The number of nodes in the tree is in the range [0, 100].
* -100 <= Node.val <= 100

## Python

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        res = []
        self.helper(root, res)
        return res

    def helper(self, root, res):
        if root is not None:
            self.helper(root.left, res)
            res.append(root.val)
            self.helper(root.right, res)
```
Runtime: 0 ms, Memory: 17.8mb

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
    vector<int> out_arr = {};

    void inorder(TreeNode *root){
        if (root == nullptr) return;
        inorder(root->left);
        out_arr.push_back(root->val);
        inorder(root->right);
    }

    vector<int> inorderTraversal(TreeNode* root) {
        inorder(root);
        return out_arr;
    }
};
```
Runtime: 0 ms, Memory: 10.9 mb

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
