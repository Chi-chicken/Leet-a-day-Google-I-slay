# 成員學習紀錄

每位成員使用一份獨立檔案整理自己的練習與複習進度。檔名統一使用 GitHub ID，方便辨識作者並減少合併衝突。

## 成員列表

新增個人頁面後，請在下表加入連結：

| 成員 | 個人進度 | 備註 |
|---|---|---|
| 專業打雜詹姆士 | [查看進度](<jamesym-lin.md>) | 一名成長期工程師 |
| 找工作才寫chichicken | [查看進度](<Chi-chicken.md>) | 一名成長期工程師 |




## 使用方式

```bash
./scripts/new-member.sh your-github-id "顯示名稱"
```

例如：

```bash
./scripts/new-member.sh jamesym-lin "專業打雜詹姆士"
```

建立後請：

1. 在上方成員列表加入自己的頁面。
2. 每次練習或複習時使用以下指令更新個人頁面，同步產生總題數與熟悉度統計：

```bash
./scripts/add-progress.sh your-github-id 733 3 cpp
```

新題目會新增紀錄；已存在的題目會更新複習日期、熟悉度與語言，保留首次完成日期及未指定的筆記。同一題不會重複計入總題數。

熟悉度定義請見 [CONTRIBUTING.md](../CONTRIBUTING.md)。
