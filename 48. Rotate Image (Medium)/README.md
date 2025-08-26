# 48. Rotate Image (Medium)

🔗 [LeetCode Link](https://leetcode.com/problems/rotate-image/)

## :beginner: Description

Q: 給定一個 n x n 矩陣 matrix，試問該如何將他順時針旋轉 90 度  

## :bulb: TIPS
1. 90 = transpose + reverse row  
2. 180 = reverse row + reverse column  
3. 270 = transpose + reverse col  

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int side = matrix.size();

        // Transpose
        for (int i=0; i < side; i++){
            for (int j=0; j < side; j++){
                if (i==j) break;
                else swap(matrix[i][j], matrix[j][i]);
            }
        }
        // 每個row做reverse
        for (int i=0; i < side; i++){
            reverse(matrix[i].begin(), matrix[i].end());
        }
    }
};
```

Runtime: 0 ms, Memory: 10 mb
