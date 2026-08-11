# 2. Add Two Numbers

> 難度：**Medium**
> 題型：`Linked List`
> 題目連結：[LeetCode](https://leetcode.com/problems/add-two-numbers/)

## 題目摘要

給定兩個 linked lists，代表兩個以顛倒的順序儲存的正整數，每個 node 代表一個 digits，將兩個數字相加回傳他們總合的 linked list。

## 解題思路

### 關鍵觀察

- 要注意進位
- 兩個 linked list 長度可能不同、不知道誰長誰短

### 演算法

1. 創建一 dummyhead，存放總和 linked list；currnode 記錄當下走到的節點；整數 carry 記錄進位
2. 跑 while 迴圈，條件是其中一個 linked list 不為 nullptr，或是 carry 不為 0
3. 迴圈內部將兩個 linked list 當下節點(如果有的話)的數值和 carry 相加，並創建 newnode 紀錄該數字，並更新 carry
4. newnode 接在 currnode->next 之後，並將 currnode 更新成 currnode->next
5. 跳出迴圈後 return dummyhead.next 

## 複雜度

- 時間：`O(max(m, n))`
- 空間：`O(max(m, n))`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
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
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode dummyhead;
        ListNode *currnode = &dummyhead;
        int carry=0;

        while (l1 || l2 || carry != 0){
            int num1 = 0, num2 = 0;
            if (l1){
                num1 = l1->val; l1 = l1->next;
            }
            if (l2){
                num2 = l2->val; l2 = l2->next;
            }

            int sum = num1 + num2 + carry;
            ListNode *newnode = new ListNode(sum % 10);
            carry = sum / 10;
            currnode = currnode->next = newnode;
        }

        return dummyhead.next;
    }
};
```

## 邊界條件與筆記

- {容易忽略的邊界條件}
- {值得複習的觀念或其他解法}
- dummyhead 可以建立在 stack 上避免 memory leak

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
