# 234. Palindrome Linked List (Easy)

> 難度：**Easy**
> 題目連結：[LeetCode](https://leetcode.com/problems/palindrome-linked-list/)

## 題目摘要

Q: 給定一個 linked list 的 head，如果他是回文就回傳 true，不是的話回傳 false

## 解題思路
遍歷 linked list 並將元素逐一加入vector中，最後用two pointers判斷該vector是否為回文。

## Python

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        vals = []
        current_node = head
        while current_node is not None:
            vals.append(current_node.val)
            current_node = current_node.next
        return vals == vals[::-1]
```
Runtime: 10 ms, Memory: 39.3 mb

## C++

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    bool isPalindrome(ListNode* head) {
        vector<int> vec;
        while (head != nullptr){
            vec.push_back(head->val);
            head = head->next;
        }
        int front = 0, tail = vec.size()-1;
        while (front <= tail){
            if (vec[front] == vec[tail]){
                front++; tail--;
            } else {
                return false;
            }
        }
        return true;
    }
};
```

Runtime: 0 ms, Memory: 132.1 mb

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
