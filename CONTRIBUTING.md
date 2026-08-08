# 新增題目指南

## 使用建立工具（推薦）

在專案根目錄執行：

```bash
./scripts/new-problem.sh 70 "Climbing Stairs" Easy
```

工具會建立 `70. Climbing Stairs (Easy)/README.md`，並自動填入題號、題名、難度與 LeetCode 連結。完成筆記後，執行：

```bash
./scripts/update-index.sh
```

## 手動建立

1. 複製 [`0. TEMPLATE/README.md`](./0.%20TEMPLATE/README.md)。
2. 目錄命名為 `{題號}. {英文題名} ({難度})`。
3. 替換所有 `{...}` 欄位；沒有使用的語言區塊可以刪除。
4. 執行 `./scripts/update-index.sh` 更新首頁索引。

## 撰寫約定

- 標題使用 `# 題號. 題名`，章節固定使用二級標題。
- 題目敘述以自己的話摘要，並附原題連結。
- 程式碼 fence 統一使用 `python`、`cpp`。
- 至少記錄解題思路、時間／空間複雜度與邊界條件。
- 執行時間與記憶體會隨測試環境波動，不作為必要欄位。

## 記錄個人學習進度

第一次參與時，先建立自己的進度頁：

```bash
./scripts/new-member.sh your-github-id "顯示名稱"
```

每完成或複習一題，需要更新兩處：

1. 在該題 README 的「個人學習紀錄」新增或更新自己的那一列。
2. 在自己的 `progress/<GitHub ID>.md` 新增或更新題目。

日期統一使用 `YYYY-MM-DD`。熟悉度採五級制：

| 等級 | 判斷標準 |
|:---:|---|
| 1 | 幾乎忘記，需要重新學習 |
| 2 | 理解題意，但無法獨立完成 |
| 3 | 在提示下可以完成 |
| 4 | 可以獨立完成並說明複雜度 |
| 5 | 可以快速完成、解釋核心觀念及比較其他解法 |

熟悉度是當下狀態，可以在複習後調高，也可以誠實調低。詳細筆記建議放在個人頁面，題目 README 的表格只留一句摘要，避免表格過寬。

## Git 更新紀錄

Git commit 已經是更新紀錄的唯一可信來源，因此不需要另外維護 Commit Log。每個 commit 建議只處理一題或一類變更，格式如下：

```text
docs(<題號>): add <成員> review notes
feat(<題號>): add Python solution
fix(<題號>): correct complexity analysis
```

修改別人的解法時，請在 Pull Request 或 commit 說明原因；個人心得則優先更新自己的學習紀錄，避免覆蓋其他成員的內容。
