# 221. Maximal Square (Medium)

🔗 [LeetCode Link](https://leetcode.com/problems/maximal-square/)

## :beginner: Description

Q: 給定一個 m x n 矩陣 matrix，裡面元素由0或1組成，試求矩陣中由1組成的最大正方形面積

## :bulb: TIPS
1. 此題為一題DP題目，需要額外創建一個dp array，dp array中記錄的是「由該位置為起點，往左上方可形成的最大方形之邊長」。因此，在解題的過程中，我們利用雙重for迴圈遍歷matrix，並同步在dp array的相同位置中更新該位置可形成的最大方形邊長。  
2. 詳細而言，在遍歷的過程中，在matrix中若遇到0，可直接在dp array中相同位置填上0，表示在該位置形成了邊長為0的正方形；若在「第一行或列」遇到1，則直接填入1，表示該位置可以形成邊長為1的正方形。  
3. 而如果在matrix邊邊以外的位置中遇到1，我們則需要觀察該位置在dp array中的左方、上方、左上方紀錄的邊長數值為多少，進而決定目前位置要填入多大的邊長。  
4. 如圖，如果dp array的左方、上方、左上方皆紀錄為1，則表示加入目前位置的這個1，便可以形成邊長為2的方形。同理，如果左方、上方、左上方皆紀錄為2，表示這些元素都可以形成邊長為2的方形，因此目前位置需填3。實作為:  
   `dp[i][j] = min({dp[i-1][j], dp[i][j-1], dp[i-1][j-1]}) + 1;`

## Python 

```python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        rows = len(matrix)
        cols = len(matrix[0]) if rows else 0
        dp = [[0] * (cols + 1) for _ in range(rows + 1)]
        maxsqlen = 0

        for i in range(1, rows + 1):
            for j in range(1, cols + 1):
                if matrix[i - 1][j - 1] == "1":
                    dp[i][j] = (min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1)

                    maxsqlen = max(maxsqlen, dp[i][j])
        
        return maxsqlen **2
```
Runtime: 151 ms, Memory: 33.1 mb

## C++

```c++
class Solution {
public:
    int maximalSquare(vector<vector<char>>& matrix) {
        int max_len = 0;
        int m = matrix.size(), n = matrix[0].size();
        vector<vector<uint16_t>> dp(m, vector<uint16_t>(n, 0));

        for (int i=0; i < m; i++){
            for (int j=0; j < n; j++){
                if (i == 0 || j == 0){
                    dp[i][j] = matrix[i][j] - '0';
                }
                else if (matrix[i][j] == '1'){
                    dp[i][j] = min({dp[i-1][j], dp[i][j-1], dp[i-1][j-1]}) + 1;
                }
                max_len = (dp[i][j] > max_len)? dp[i][j]: max_len;
            }
        }

        return max_len * max_len;
    }
};
```

Runtime: 6 ms; Memory: 29.2 mb
