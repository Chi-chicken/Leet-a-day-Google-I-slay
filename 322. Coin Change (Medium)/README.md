# 322. Coin Change

🔗 [LeetCode Link](https://leetcode.com/problems/coin-change/)

## :beginner: Description

給定 coins (零錢單位組合)，用該組合計算湊到 amount 價錢所需要的最少硬幣數量，若無法用該組合湊得 amount 則回傳 -1

**TIPS:**  
思考該如何拆解成子問題? 想像成爬樓梯題目。
例如 coins 為 [1, 2, 5]，amount 為 11，要得到 11 元可以是:
1. 10元 + 1元
2. 9元 + 2元
3. 6元 + 5元

就像是要踏上第 11 階的階梯，最後一步可以跨越 1、2、或 5 階，所以只要訂好初始條件，從頭開始遍歷就能得到解答。

STEPS:
1. 宣告 DP 陣列 amount + 1 個元素，每個元素的數值為 amount + 1，作為高電壓閾值，第一個元素設為 0
2. 接著開始遍歷 dp 陣列，目標是經過每一個元素都要找到它的最小硬幣數目
3. 在每個元素中都要遍歷 coins，如果當下索引大於等於硬幣幣值，就與最小硬幣數目進行比較
4. 最後 return dp[amount]；但如果 dp[amount] 為 amount+1，代表沒有找到最小硬幣數目，只能 return -1

**Constraints:**  
* 1 <= coins.length <= 12
* 1 <= coins[i] <= 2^31 - 1
* 0 <= amount <= 10^4

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        vector<int> fewest(amount+1, amount+1);
        fewest[0] = 0;
        int minimum;
        for (int i=1; i<=amount; i++){
            minimum = amount+1;
            for (int coin : coins){
                if ((i - coin) >= 0) 
                    minimum = min(minimum, 1+fewest[i - coin]);
            }
            fewest[i] = minimum;
        }
        return (fewest[amount] > amount)? -1 : fewest[amount];
    }
};
```
Runtime: 7 ms, Memory: 17.8 mb

