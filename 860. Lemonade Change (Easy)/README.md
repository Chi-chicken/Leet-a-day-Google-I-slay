# 860. Lemonade Change

> 難度：**Easy**
> 題型：`Greedy`
> 題目連結：[LeetCode](https://leetcode.com/problems/lemonade-change/)

## 題目摘要

有一列顧客在檸檬汁攤位前面排隊，一杯檸檬汁賣 5 元，顧客有可能付 5, 10, 20 元，必須找給顧客對的零錢。
假設手上原本沒有零錢，給定整數陣列 bills[i] 代表顧客依序會付的錢，回傳能否找給每個顧客對的零錢

## 解題思路

### 關鍵觀察

- 必須記住手上會有的零錢
- 當顧客付 20 塊錢，有兩種找法，選擇哪一種對未來的限制比較小? 

### 演算法

1. 創建變數記住 5 和 10 元的數目
2. 跑 For 迴圈，根據顧客付的錢增加或是減少對應零錢的數目
3. 每一輪結束判斷手上的零錢是否都 >= 0，如果為非回傳 false，如果 For 迴圈能夠跑完回傳 true

## 複雜度

- 時間：`O(n)`
- 空間：`O(1)`

## Python

```python
class Solution:
    pass
```

## C++

```cpp
class Solution {
private:
enum coins {
    FIVE,
    TEN,
};
public:
    bool lemonadeChange(vector<int>& bills) {
        vector<int> changes(2,0);
        for (int i=0; i< bills.size(); i++){
            if (bills[i] == 5){
                changes[FIVE]++;
            } 
            else if (bills[i] == 10){
                changes[TEN]++;
                changes[FIVE]--;
            }
            else{
                if (changes[TEN] > 0){
                    changes[TEN]--;
                    changes[FIVE]--;
                }
                else {
                    changes[FIVE] -= 3;
                }
            }
            if (changes[FIVE] < 0 || changes[TEN] < 0) return false;
        }

        return true;
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
