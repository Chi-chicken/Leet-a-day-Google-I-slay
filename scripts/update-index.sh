#!/usr/bin/env bash
set -euo pipefail

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
index_file="$project_root/PROBLEMS.md"
status_file="$project_root/data/language-status.tsv"
temporary_file=$(mktemp)
trap 'rm -f "$temporary_file"' EXIT

usage() {
    echo 'Usage:' >&2
    echo '  ./scripts/update-index.sh' >&2
    echo '  ./scripts/update-index.sh <number> <python|cpp> [done|pending]' >&2
}

has_problem() {
    find "$project_root" -mindepth 1 -maxdepth 1 -type d \
        -name "$1. * (Easy)" -o -name "$1. * (Medium)" -o -name "$1. * (Hard)" \
        | grep -q .
}

has_status() {
    awk -v number="$1" -v language="$2" \
        '$1 == number && $2 == language { found = 1 } END { exit !found }' "$status_file"
}

if [[ $# -ne 0 && ( $# -lt 2 || $# -gt 3 ) ]]; then
    usage
    exit 1
fi

if [[ $# -ge 2 ]]; then
    number=$1
    language=${2,,}
    action=${3:-done}

    [[ $number =~ ^[0-9]+$ ]] || { echo 'Error: number must be a positive integer.' >&2; exit 1; }
    has_problem "$number" || { echo "Error: problem $number does not exist." >&2; exit 1; }

    case "$language" in
        py|python) language=python ;;
        c++|cpp) language=cpp ;;
        *) echo 'Error: language must be python or cpp.' >&2; exit 1 ;;
    esac

    case "$action" in
        done)
            if ! has_status "$number" "$language"; then
                printf '%s\t%s\n' "$number" "$language" >> "$status_file"
                sort -t $'\t' -k1,1n -k2,2 -u "$status_file" -o "$status_file"
            fi
            echo "Marked: problem $number / $language = ✅"
            ;;
        pending)
            awk -v number="$number" -v language="$language" \
                '!($1 == number && $2 == language)' "$status_file" > "$temporary_file"
            mv "$temporary_file" "$status_file"
            temporary_file=$(mktemp)
            echo "Marked: problem $number / $language = 📝"
            ;;
        *) echo 'Error: status must be done or pending.' >&2; exit 1 ;;
    esac
fi

total=0
easy=0
medium=0
hard=0
python_done=0
cpp_done=0

while IFS= read -r -d '' readme; do
    directory=$(basename "$(dirname "$readme")")
    [[ $directory =~ ^([0-9]+)\.\ (.+)\ \((Easy|Medium|Hard)\)$ ]] || continue
    number=${BASH_REMATCH[1]}
    difficulty=${BASH_REMATCH[3]}
    total=$((total + 1))
    case "$difficulty" in
        Easy) easy=$((easy + 1)) ;;
        Medium) medium=$((medium + 1)) ;;
        Hard) hard=$((hard + 1)) ;;
    esac
    has_status "$number" python && python_done=$((python_done + 1)) || true
    has_status "$number" cpp && cpp_done=$((cpp_done + 1)) || true
done < <(find "$project_root" -mindepth 2 -maxdepth 2 -name README.md -print0)

{
    echo '# 題目索引'
    echo
    echo '> [!CAUTION]'
    echo '> **此檔案由 `./scripts/update-index.sh` 自動產生，請勿手動修改！**'
    echo '> 手動修改的內容會在下次執行腳本時被覆蓋；請修改題目 README 或語言狀態後，再執行更新腳本。'
    echo
    echo '## 專案概況'
    echo
    echo '| 題目數 | Easy | Medium | Hard | Python 完成 | C++ 完成 |'
    echo '|---:|---:|---:|---:|---:|---:|'
    printf '| %d | %d | %d | %d | %d | %d |\n' "$total" "$easy" "$medium" "$hard" "$python_done" "$cpp_done"
    echo
    echo '- `✅`：已完成該語言的解法'
    echo '- `📝`：尚未完成或等待補充'
    echo '- [依題型瀏覽題目](./TOPICS.md)'
    echo
    echo '## 完整題目索引'
    echo
    echo '| # | 題目 | 難度 | Python | C++ |'
    echo '|--:|---|:---:|:---:|:---:|'

    find "$project_root" -mindepth 2 -maxdepth 2 -name README.md -print0 \
        | while IFS= read -r -d '' readme; do
            directory=$(basename "$(dirname "$readme")")
            [[ $directory =~ ^([0-9]+)\.\ (.+)\ \((Easy|Medium|Hard)\)$ ]] || continue
            number=${BASH_REMATCH[1]}
            title=${BASH_REMATCH[2]}
            difficulty=${BASH_REMATCH[3]}
            python_status='📝'
            cpp_status='📝'
            has_status "$number" python && python_status='✅'
            has_status "$number" cpp && cpp_status='✅'
            relative=${readme#"$project_root/"}
            encoded=${relative// /%20}
            printf '%08d\t| %d | [%s](./%s) | %s | %s | %s |\n' \
                "$number" "$number" "$title" "$encoded" "$difficulty" "$python_status" "$cpp_status"
        done | sort -n | cut -f2-
} > "$temporary_file"

mv "$temporary_file" "$index_file"
trap - EXIT
echo "Updated: $index_file"
"$project_root/scripts/update-topics.sh"
