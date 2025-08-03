# 3201. Find the Maximum Length of Valid Subsequence I

## :beginner: Description

給定一個陣列 nums，子陣列sub是合理的符合以下條件
(sub[0] + sub[1]) % 2 == (sub[1] + sub[2]) % 2 == ... == (sub[x - 2] + sub[x - 1]) % 2.
回傳sub的最長長度



**TIPS:**  
子陣列sub相鄰兩數相加mod 2一致，要分為以下三種情況討論
1. 每個數皆為偶數
2. 每個數皆為奇數
3. 奇偶相間

**Constraints:**

* 1 <= nums.length <= 10^5
* 1 <= nums[i] <= 10^9

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    int maximumLength(vector<int>& nums) {
        int o_cnt=0, e_cnt=0, alter_cnt=1;
        bool last_is_odd = false;
        if (nums[0] % 2 == 1){
            o_cnt++;
            last_is_odd = true;
        }
        else{
            e_cnt++;
            last_is_odd = false;
        }

        for (int i=1; i<nums.size(); i++){
            if (nums[i] % 2 == 1){
                o_cnt++;
                if (!last_is_odd){
                    alter_cnt++;
                    last_is_odd = true;
                }
            }
            else {
                e_cnt++;
                if (last_is_odd){
                    alter_cnt++;
                    last_is_odd = false;
                }
            }
        }

        return max({o_cnt, e_cnt, alter_cnt});
    }
};
```
Runtime: 0 ms, Memory: 96.3 mb
