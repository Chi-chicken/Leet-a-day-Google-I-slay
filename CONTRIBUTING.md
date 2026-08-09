# 貢獻指南

新增題目、解法、個人紀錄或討論前，請先閱讀本文件。所有指令都應在專案根目錄執行。

## 開始前

- 不要手動修改 `PROBLEMS.md`、`TOPICS.md` 或 `data/language-status.tsv`。
- 保留其他成員的解法、討論與個人頁面；需要調整時請說明原因。
- 一個 commit 盡量只處理一題或一種維護工作，方便審查與追蹤。

## 標準工作流程

### 1. 建立題目

```bash
./scripts/new-problem.sh 70 "Climbing Stairs" Easy
```

目錄會依 `{題號}. {英文題名} ({Easy|Medium|Hard})` 命名，並從 [題解公版](./0.%20TEMPLATE/README.md) 建立 README。若題目已存在，請直接編輯既有檔案，不要建立重複目錄。

腳本會依英文題名推導 LeetCode 網址；遇到縮寫、特殊符號或題名不完全一致時，請開啟連結確認並手動修正題目 README。

### 2. 完成題解內容

替換 README 中所有 `{...}` 欄位，並至少記錄：

- 題目摘要與 LeetCode 連結
- 題型、關鍵觀察與演算法步驟
- 時間與空間複雜度
- 至少一種語言的完整實作
- 邊界條件或容易犯錯之處

程式碼 fence 統一使用 `python` 或 `cpp`。沒有實作的語言可以保留待辦骨架，也可以刪除該區塊。

### 3. 填寫題型

一題可有多個題型，使用半形逗號分隔：

```markdown
> 題型：`Greedy`, `Sorting`
```

請先查看 [TOPICS.md](./TOPICS.md) 並沿用既有名稱與大小寫。例如使用 `Dynamic Programming` 後，就不要再建立 `DP` 或 `dynamic programming`。

### 4. 更新語言狀態與索引

完成某個語言的解法後，以題號和語言標記：

```bash
./scripts/update-index.sh 70 python
./scripts/update-index.sh 70 cpp
```

支援 `python`、`py`、`cpp` 與 `c++`。標記後會同步更新 `PROBLEMS.md` 和 `TOPICS.md`。

需要改回待完成狀態時：

```bash
./scripts/update-index.sh 70 python pending
```

只重新掃描題目、難度與題型，不改變語言狀態時：

```bash
./scripts/update-index.sh
```

產生的 `PROBLEMS.md`、`TOPICS.md` 及狀態變更需要一起提交，但不要直接編輯這些產生檔。

### 5. 更新個人進度

第一次參與時建立個人頁面：

```bash
./scripts/new-member.sh your-github-id "顯示名稱"
```

實際範例：

```bash
./scripts/new-member.sh jamesym-lin "專業打雜詹姆士"
```

接著在 `progress/README.md` 的成員列表加入連結。每次完成或複習題目，只更新自己的 `progress/<GitHub ID>.md`；日期使用 `YYYY-MM-DD`。

從個人頁面連到題目時，路徑需要先回到上一層：

```markdown
[70. Climbing Stairs](<../70. Climbing Stairs (Easy)/README.md>)
```

熟悉度使用以下標準：

| 等級 | 判斷標準 |
|:---:|---|
| 1 | 幾乎忘記，需要重新學習 |
| 2 | 理解題意，但無法獨立完成 |
| 3 | 在提示下可以完成 |
| 4 | 可以獨立完成並說明複雜度 |
| 5 | 可以快速完成、解釋核心觀念及比較其他解法 |

熟悉度可以隨複習結果調高或調低，不需要同步寫入題目 README。

### 6. 檢查並提交

提交前至少確認：

```bash
./scripts/update-index.sh
git diff --check
git status
```

確認索引、個人頁面與題目連結都正確，再提交相關檔案。

## 討論與補充

每題 README 最下方的「討論與補充」只用於共用內容：

- 解法或複雜度疑問
- 替代解法與最佳化方向
- 勘誤、測試案例及邊界條件

新增內容時使用以下格式，並保留其他成員的討論：

```markdown
### @GitHub-ID — YYYY-MM-DD

- 類型：疑問 / 替代解法 / 最佳化 / 勘誤
- 內容：具體描述想法或問題。
```

個人心得、日期與熟悉度應放在自己的進度頁，避免重複維護。

## Git 與 commit 規範

Git history 是修改時間與作者的正式紀錄，不另外維護 Commit Log。建議使用：

```text
feat(2078): add C++ solution and learning notes
docs(2078): update jamesym-lin review notes
fix(435): correct complexity analysis
chore: regenerate problem and topic indexes
```

- `feat`：新增題目或完整解法
- `docs`：更新說明、討論或個人學習紀錄
- `fix`：修正解法、連結、複雜度或錯誤內容
- `chore`：整理格式、腳本或產生檔等維護工作

修改其他成員的內容時，請在 commit 或 Pull Request 說明原因。不要把多個無關題目塞進同一個 commit。
