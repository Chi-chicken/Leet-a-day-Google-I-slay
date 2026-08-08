#!/usr/bin/env bash
set -euo pipefail

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
index_file="$project_root/PROBLEMS.md"
temporary_file=$(mktemp)
trap 'rm -f "$temporary_file"' EXIT

{
    echo '# 題目索引'
    echo
    echo '> 此檔案由 `./scripts/update-index.sh` 產生，請勿手動修改。'
    echo
    echo '| # | 題目 | 難度 | 狀態 |'
    echo '|--:|---|:---:|:---:|'

    find "$project_root" -mindepth 2 -maxdepth 2 -name README.md -print0 \
        | while IFS= read -r -d '' readme; do
            directory=$(basename "$(dirname "$readme")")
            [[ $directory =~ ^([0-9]+)\.\ (.+)\ \((Easy|Medium|Hard)\)$ ]] || continue
            number=${BASH_REMATCH[1]}
            title=${BASH_REMATCH[2]}
            difficulty=${BASH_REMATCH[3]}
            if grep -qE '^class Solution|^## (Python|C\+\+)' "$readme" && ! grep -q '{用自己的話' "$readme"; then
                status='✅'
            else
                status='📝'
            fi
            relative=${readme#"$project_root/"}
            encoded=${relative// /%20}
            printf '%08d\t| %d | [%s](./%s) | %s | %s |\n' "$number" "$number" "$title" "$encoded" "$difficulty" "$status"
        done | sort -n | cut -f2-
} > "$temporary_file"

mv "$temporary_file" "$index_file"
trap - EXIT
echo "Updated: $index_file"
