# Leet-a-day, Google I Slay

以 LeetCode 題目累積演算法觀念、解題思路與 Python／C++ 實作的學習紀錄。

## 專案導覽

- [查看專案概況與完整題目索引](./PROBLEMS.md)
- [查看成員學習紀錄](./progress/README.md)
- [查看題解公版](./0.%20TEMPLATE/README.md)
- [查看新增題目指南](./CONTRIBUTING.md)

## 快速新增題目

```bash
./scripts/new-problem.sh 70 "Climbing Stairs" Easy
```

完成某個語言的題解後，標記語言並更新索引：

```bash
./scripts/update-index.sh 2078 cpp
```

只重新產生索引、不改變狀態時，執行 `./scripts/update-index.sh`。

腳本會建立符合 `{題號}. {英文題名} ({難度})` 命名規則的目錄，並由公版帶入基本資料。更完整的欄位說明與手動新增方式請見 [CONTRIBUTING.md](./CONTRIBUTING.md)。

## 多人學習紀錄

每題 README 最下方都有「個人學習紀錄」，用來記錄各成員的完成日期、最近複習日期、熟悉度及簡短筆記。每位成員另有一份獨立的 `progress/<GitHub 帳號>.md`，集中整理自己的進度，減少多人同時編輯同一檔案造成的衝突。

第一次加入時建立個人頁面：

```bash
./scripts/new-member.sh your-github-id "顯示名稱"
```

例如：

```bash
./scripts/new-member.sh jamesym-lin "專業打雜詹姆士"
```

熟悉度統一使用 `1`～`5`：`1` 代表需要重新學習，`3` 代表能在提示下完成，`5` 代表能獨立完成並解釋思路。完整規則請見 [成員學習紀錄](./progress/README.md)。

## 更新紀錄原則

不另外手動維護「誰在何時修改哪一題」的大表。Git 已經保留作者、時間與每一行的修改紀錄，手動再記一次容易遺漏或失真。建議 commit message 使用：

```text
docs(70): add James's review notes
feat(200): add Python DFS solution
```

查詢單題歷史可使用 `git log --follow -- "題目目錄/README.md"`；查詢每一行最後由誰修改可使用 `git blame "題目目錄/README.md"`。

## 題解建議內容

每份筆記盡量包含：

- 題目摘要與原題連結
- 關鍵觀察與演算法步驟
- 時間、空間複雜度
- Python／C++ 實作（可只保留實際使用的語言）
- 邊界條件、常見陷阱與複習筆記

## Markdown 參考

- [GitHub Markdown 基本語法](https://docs.github.com/zh/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
