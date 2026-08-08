## 961. N-Repeated Element in Size 2N Array (Easy)

> 難度：**Easy**
> 題目連結：[LeetCode](https://leetcode.com/problems/n-repeated-element-in-size-2n-array/)

---

### 📌 題目資訊

- **題號**：961
- **題名**：N-Repeated Element in Size 2N Array
- **難度**：Easy
- **題型**：Array / Math / Pigeonhole Principle

---

### 🧠 題意說明（Description）

給定一個整數陣列 `nums`，其長度為 `2 * n`。
陣列中一共有 `n + 1` 種不同的元素，其中 **只有一個元素會重複出現 `n` 次**，其餘元素皆只出現一次。

請回傳那個 **重複出現 n 次的元素**。

---

### 💡 關鍵觀察（Key Idea / Observation）

**Pigeonhole Principle（鴿籠原理）**

如果你把很多鴿子塞進比鴿子數量還少的籠子，
那一定有某個籠子裡至少有兩隻鴿子。

- 重複元素佔據了 `n / (2n) = 1/2` 的位置
- 其餘元素皆為 distinct
- 若我們觀察 **最小有意義的視窗大小為 3**
- 則必定存在一個長度為 3 的 subarray，其中：
  - 至少有 **2 個位置** 會是那個重複元素

👉 因此，只要檢查：
- `nums[i] == nums[i-1]`
- `nums[i] == nums[i-2]`

即可找出答案

---

### ⚠️ 邊界條件與陷阱（Edge Cases / Pitfalls）

- 例外情況：[4, 1, 2, 4]

- 由於我們只掃描到 `n-2`，最後一個元素可能沒有被比較到
- 但題目 **保證一定有解**
- 若前面都沒找到，則 **最後一個元素必定是答案**

---

### 🛠 解法思路（Approach）

1. 從 index = 2 開始遍歷陣列
2. 比較：
 - `nums[i] == nums[i-1]`
 - `nums[i] == nums[i-2]`
3. 若成立，直接回傳 `nums[i]`
4. 若都沒有命中，回傳最後一個元素

---

### ⏱ 時間與空間複雜度（Complexity Analysis）

- **Time Complexity**：`O(n)`
- **Space Complexity**：`O(1)`
- In-place：✅
- 無需額外資料結構

---

### ⚙️ C++ 解法

```cpp
class Solution {
public:
  int repeatedNTimes(vector<int>& nums) {
      int n = nums.size();
      for (int i = 2; i < n; i++) {
          if (nums[i] == nums[i - 1] || nums[i] == nums[i - 2]) {
              return nums[i];
          }
      }
      // Edge case: only remaining candidate
      return nums[n - 1];
  }
};
```

---

## 🐍 Python 解法

```python
class Solution:

```

## 討論與補充

> 歡迎提出疑問、替代解法、最佳化方向或勘誤；個人進度請記錄在自己的 `progress/<GitHub ID>.md`。

<!--
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：請具體描述想法或問題。
-->
