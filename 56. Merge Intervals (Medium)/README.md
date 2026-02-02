# 56. Merge Intervals

🔗 [LeetCode Link](https://leetcode.com/problems/merge-intervals/)

## :beginner: Description

把有重疊的區間合併起來，最後只留下「不重疊」的區間集合。

**TIPS:**  
- 先把所有區間依照起點排序，從左到右掃描區間。
- 只要區間裡面比較大的數，小於下一個區間的起始數，就代表不重疊，反之則要合併。

## Python 

```python 
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x : x[0])

        merged = []
        for interval in intervals:
            if not merged or merged[-1][1] < interval[0]:
                merged.append(interval)
            else:
                merged[-1][1] = max(merged[-1][1], interval[1])

        return merged
```
Runtime: 9 ms, Memory: 37.95 mb

#### Complexity Analysis

- Time complexity : O(nlogn)
  - 排序 O(n log n) + 掃描 O(n)

- Space complexity : O(logN) (or O(n))
  - 排序 O(log n) (For python)

## C++

```c++

```
Runtime:  ms, Memory:  mb
