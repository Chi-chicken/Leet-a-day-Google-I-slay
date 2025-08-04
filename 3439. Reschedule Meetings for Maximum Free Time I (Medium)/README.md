# 3439. Reschedule Meetings for Maximum Free Time I

🔗 [LeetCode Link](https://leetcode.com/problems/reschedule-meetings-for-maximum-free-time-i/description/)

## :beginner: Description

這題要我們重新安排會議以得到最大的休息時間

1. int 變數 eventTime 是我所有擁有的時間
2. 陣列 startTime 以及 endTime 擁有相同數目 n 的元素，裡面分別是 n 場會議開始以及結束的時間。
   例如: startTime[i] 是第 i 場會議開始的時間、endTime[i] 是該場會議結束的時間。(會議之間不會重疊)
3. int 變數 k 是你可以移動的會議數目，透過移動 k 場會議的時間，試求能夠得到的最長休息時間為何。
(會議順序不可調動)

**TIPS:**  
1. 目前陣列中只有會議開始以及結束的時間，但我們關注的焦點是休息時間，是否可以先得到我們目前有的休息時間陣列?
2. 可以試想移動會議這件事對我們的休息時間會產生什麼影響?

ANS:
1. 計算休息時間陣列，注意 N 場會議會隔出 N+1 段休息時間
2. 移動會議時間其實就是將該場會議前後的休息時間相加，例如我們可以移動 1 場會議，其實就會有 2 個休息時間片段被合併；
   移動 k 場會議，就會有 k+1 段時間片段被合併
3. 因此，我們可以利用長度 k+1 的 sliding window，在我們建立好的休息時間陣列上滑動，並記錄相加求得的最大值

**Constraints:**

* 1 <= eventTime <= 10^9
* n == startTime.length == endTime.length
* 2 <= n <= 10^5
* 1 <= k <= n
* 0 <= startTime[i] < endTime[i] <= eventTime
* endTime[i] <= startTime[i + 1] where i lies in the range [0, n - 2]

## Python 

```python

```
Runtime: ms, Memory: mb

## C++

```c++
class Solution {
public:
    int maxFreeTime(int eventTime, int k, vector<int>& startTime, vector<int>& endTime) {
        int meetings_no = startTime.size();
        vector<int> free_interval(meetings_no + 1);

        free_interval[0] = startTime[0] - 0;
        for (int i=1; i < meetings_no; i++){
            free_interval[i] = startTime[i] - endTime[i-1];
        }
        free_interval[meetings_no] = eventTime - endTime[meetings_no-1];

        int start = 0, end = k;
        int max_freeTime = 0, tmp = 0;
        for (int i=start; i<=end; i++){
            max_freeTime += free_interval[i];
        }
        tmp = max_freeTime;

        for (int i=0; i < meetings_no-k; i++){
            tmp -= free_interval[start++];
            tmp += free_interval[++end];
            max_freeTime = max(max_freeTime, tmp);
        }

        return max_freeTime;
    }
};
```
Runtime: 2 ms, Memory: 123.24 mb
