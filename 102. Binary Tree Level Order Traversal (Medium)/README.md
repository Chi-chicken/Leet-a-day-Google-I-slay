# 102. Binary Tree Level Order Traversal (Medium)

🔗 [LeetCode Link](https://leetcode.com/problems/binary-tree-level-order-traversal/)

## :beginner: Description

經典的BFS

給你一棵二元樹，要一層一層由上到下、由左到右讀取節點的值，最後回傳一個二維陣列，每一個子陣列代表一層。

## :bulb: TIPS
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

### Complexity Analysis

Time complexity: O(N) 每個節點只進出 queue 一次

Space complexity: O(N) 最壞情況 queue 會存一整層的節點


## C++

```c++

```

Rumtime:  ms, Memory:  mb
