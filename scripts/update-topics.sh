#!/usr/bin/env bash
set -euo pipefail

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
topics_file="$project_root/TOPICS.md"
records_file=$(mktemp)
temporary_file=$(mktemp)
trap 'rm -f "$records_file" "$temporary_file"' EXIT

while IFS= read -r -d '' readme; do
    directory=$(basename "$(dirname "$readme")")
    [[ $directory =~ ^([0-9]+)\.\ (.+)\ \((Easy|Medium|Hard)\)$ ]] || continue
    number=${BASH_REMATCH[1]}
    title=${BASH_REMATCH[2]}
    difficulty=${BASH_REMATCH[3]}
    topic_line=$(sed -n 's/^> 題型：//p' "$readme" | head -n 1)

    [[ -n $topic_line && $topic_line != *'{題型}'* ]] || continue
    topic_line=${topic_line//\`/}
    IFS=',' read -r -a topics <<< "$topic_line"

    relative=${readme#"$project_root/"}
    encoded=${relative// /%20}
    for topic in "${topics[@]}"; do
        topic=$(printf '%s' "$topic" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')
        [[ -n $topic ]] || continue
        printf '%s\t%08d\t%d\t%s\t%s\t%s\n' \
            "$topic" "$number" "$number" "$title" "$difficulty" "$encoded" >> "$records_file"
    done
done < <(find "$project_root" -mindepth 2 -maxdepth 2 -name README.md -print0)

{
    echo '# 題型索引'
    echo
    echo '> [!CAUTION]'
    echo '> **此檔案由 `./scripts/update-index.sh` 自動產生，請勿手動修改！**'
    echo '> 請修改各題 README 的「題型」欄位後，再執行更新腳本。'
    echo
    echo '題型格式範例：'
    echo
    echo '```markdown'
    echo '> 題型：`Greedy`, `Sorting`'
    echo '```'
    echo
    echo '## 類別總覽'
    echo
    echo '| 題型 | 題目數 |'
    echo '|---|---:|'

    if [[ -s $records_file ]]; then
        cut -f1 "$records_file" | sort -f | uniq -c \
            | while read -r count topic; do printf '| %s | %d |\n' "$topic" "$count"; done
        current_topic=''
        while IFS=$'\t' read -r topic padded_number number title difficulty encoded; do
            if [[ $topic != "$current_topic" ]]; then
                echo
                printf '## %s\n\n' "$topic"
                current_topic=$topic
            fi
            printf -- '- [%d. %s](./%s) — %s\n' "$number" "$title" "$encoded" "$difficulty"
        done < <(sort -f -t $'\t' -k1,1 -k2,2n "$records_file")
    else
        echo '| — | 0 |'
        echo
        echo '> 尚未填寫任何題型。'
    fi
} > "$temporary_file"

mv "$temporary_file" "$topics_file"
trap - EXIT
rm -f "$records_file"
echo "Updated: $topics_file"
