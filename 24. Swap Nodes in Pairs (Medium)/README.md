# 24. Swap Nodes in Pairs

🔗 [LeetCode Link](https://leetcode.com/problems/swap-nodes-in-pairs/)

## :beginner: Description

將給定 linked list 中的 nodes 倆倆為一組進行交換

**TIPS:**  
1. 先 new 一個 dummyhead 並接到 head，建立 currNode 指向 dummyhead。
2. 接下來 while loop 判斷 currNode->next 及 currNode->next->next 是否為 nullptr，若非，則可進行交換。
3. 倆倆交換可使用 tempNode 來暫存要調整的節點，進行指標更新。

**Constraints:**  
* The number of nodes in the list is in the range [0, 100].
* 0 <= Node.val <= 100

## Python 

```python

```
Runtime: ms, Memory: mb

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
    ListNode* swapPairs(ListNode* head) {
        ListNode *dummyhead = new ListNode();
        dummyhead->next = head;
        ListNode *currNode = dummyhead, *tempNode = nullptr;

        while (currNode->next != nullptr && currNode->next->next != nullptr){
            tempNode = currNode->next->next;
            currNode->next->next = tempNode->next;
            tempNode->next = currNode->next;
            currNode->next = tempNode;
            currNode = currNode->next->next;
        }

        head = dummyhead->next;
        delete dummyhead;
        return head;
    }
};
```
Runtime: 0 ms, Memory: 11.2 mb

