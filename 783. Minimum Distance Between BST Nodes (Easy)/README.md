# 783. Minimum Distance Between BST Nodes

🔗 [LeetCode Link](https://leetcode.com/problems/minimum-distance-between-bst-nodes/description/)

## :beginner: Description

在 binary search tree 中找到任意兩個 node 相差最小的數值

**TIPS:**  
1. 因為是 BST，所以用 In-order traversal 的方式可以依照數值從小到大進行遍歷
2. 將 lastval 以及 minDiff 設在 main function 的作用域之外，在遍歷的過程中不斷更新 lastval 以及比較 minDiff

**Constraints:**  
* The number of nodes in the tree is in the range [2, 100].
* 0 <= Node.val <= 10^5

## Python 

```python

```
Runtime: ms, Memory: mb

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

