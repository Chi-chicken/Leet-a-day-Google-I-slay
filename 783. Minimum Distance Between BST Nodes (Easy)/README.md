# 783. Minimum Distance Between BST Nodes

> 難度：**Easy**  \n> 題目連結：[LeetCode](https://leetcode.com/problems/minimum-distance-between-bst-nodes/)

🔗 [LeetCode Link](https://leetcode.com/problems/minimum-distance-between-bst-nodes/description/)

## 題目摘要

在 binary search tree 中找到任意兩個 node 相差最小的數值

**TIPS:**
1. 因為是 BST，所以用 In-order traversal 的方式可以依照數值從小到大進行遍歷
2. 將 lastval 以及 minDiff 設在 main function 的作用域之外，在遍歷的過程中不斷更新 lastval 以及比較 minDiff

**Constraints:**
* The number of nodes in the tree is in the range [2, 100].
* 0 <= Node.val <= 10^5

## Python

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        self.prev = None
        self.min_diff = float('inf')

        def inorder(node):
            if not node:
                return

            inorder(node.left)
            if self.prev is not None:
                self.min_diff = min(self.min_diff, node.val - self.prev)

            self.prev = node.val
            inorder(node.right)

        inorder(root)
        return self.min_diff
```
Runtime: 3 ms, Memory: 17.9 mb

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
    int lastval = -1, minDiff = INT_MAX;
    // Inorder traversal: 左子樹 -> 中間節點 -> 右子樹
    int minDiffInBST(TreeNode* root) {
        if (root->left != nullptr) minDiffInBST(root->left);
        if (lastval != -1) minDiff = min(minDiff, root->val - lastval);
        lastval = root->val;
        if (root->right != nullptr) minDiffInBST(root->right);
        return minDiff;
    }
};
```
Runtime: 0 ms, Memory: 12.3 mb

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
