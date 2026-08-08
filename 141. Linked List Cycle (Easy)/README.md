# 141. Linked List Cycle

> 難度：**Easy**
> 題目連結：[LeetCode](https://leetcode.com/problems/linked-list-cycle/)

## 題目摘要

給定一個 linked list，判斷他是否有一個 cycle 在裡面，有的話回傳 true，否則回傳 false

**TIPS:**
有趣的一道題目，可以建立一個 fastptr、一個 slowptr，fastptr 每次走兩步，slowptr 每次走一步。
若 fastptr 和 slowptr 最終指向同一個位址，表示 linked list 中存在 cycle，回傳 true。
若 fastptr 走到了 null，則表示走到底，沒有 cycle，回傳 false。

**Constraints:**
* The number of the nodes in the list is in the range [0, 10^4].
* -10^5 <= Node.val <= 10^5
* pos is -1 or a valid index in the linked list.

## Python

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        slow = head
        fast = head

        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

            if slow == fast:
                return True
        return False

```
Runtime: 45ms, Memory: 19.9mb

## C++

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    bool hasCycle(ListNode *head) {
        ListNode *slow = head, *fast = head;
        while (fast != nullptr && fast->next != nullptr){
            fast = fast->next->next;
            slow = slow->next;
            if (fast == slow)
                return true;
        }
        return false;
    }
};
```
Runtime: 8 ms, Memory: 11.9 mb

## 個人學習紀錄

| 成員 | 首次完成 | 最近複習 | 熟悉度 | 個人筆記 |
|---|:---:|:---:|:---:|---|
| GitHub ID | YYYY-MM-DD | YYYY-MM-DD | 1～5 | 容易忘記的觀念、下次複習重點或個人解法連結 |
