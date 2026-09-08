# Rebuild the managed summary from distinct problems in the records section.
function summary(    i) {
    print "<!-- progress-summary:start -->"
    print "## 練習統計"
    print ""
    printf "總練習題數：**%d**（同一題只計算一次）\n", total
    print ""
    print "| 熟悉度 | 題數 |"
    print "|:---:|---:|"
    for (i = 1; i <= 5; i++) printf "| %d | %d |\n", i, counts[i]
    print ""
    print "<!-- progress-summary:end -->"
    print ""
}
/^<!-- progress-summary:start -->$/ { managed = 1; next }
managed {
    if ($0 == "<!-- progress-summary:end -->") { managed = 0; skip_blank = 1 }
    next
}
skip_blank { skip_blank = 0; if ($0 == "") next }
{
    lines[++size] = $0
    if ($0 == "## 題目紀錄") records = 1
    else if (/^## /) records = 0
    if (records && /^\| \[[0-9]+\./) {
        number = $0
        sub(/^\| \[/, "", number)
        sub(/\..*$/, "", number)
        split($0, fields, "|")
        if (!seen[number + 0]++) {
            total++
            counts[fields[5] + 0]++
        }
    }
}
END {
    for (line = 1; line <= size; line++) {
        if (lines[line] == "## 題目紀錄") summary()
        print lines[line]
    }
}
