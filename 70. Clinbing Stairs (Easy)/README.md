# 70. Climbing Stairs

## :beginner: Description

You are climbing a staircase. It takes `n` steps to reach the top.

Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?


**Example 1:**

>**Input:** `n = 2`
>
>**Output:** `2`
>
>**Explanation:** There are two ways to climb to the top.
>1. 1 step + 1 step
>2. 2 steps

**Example 2:**

>**Input:** `n = 3`
>
>**Output:** `3`
>
>**Explanation:** There are three ways to climb to the top.
>1. 1 step + 1 step + 1 step
>2. 1 step + 2 steps
>3. 2 steps + 1 step

**Constraints:**

*   `1 <= n <= 45`

## Python 

``` python
class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 1 :
            return 1
        first = 1
        second = 2
        for i in range(3, n+1):
            third = first + second
            first = second
            second = third
        return second
```
Runtime: 0ms, Memory: 17.8mb

## C++

``` c++
```

Runtime: ms, Memory: mb

