#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo 'Usage: ./scripts/add-progress.sh <github-id> <number> <mastery:1-5> <python|cpp> [note]' >&2
    echo 'Example: ./scripts/add-progress.sh jamesym-lin 860 4 cpp "Greedy：逐筆檢查找零是否足夠"' >&2
}

if [[ $# -lt 4 || $# -gt 5 ]]; then
    usage
    exit 1
fi

github_id=$1
number=$2
mastery=$3
language=${4,,}
note=${5:-}

[[ $github_id =~ ^[A-Za-z0-9-]+$ ]] || { echo 'Error: invalid GitHub ID.' >&2; exit 1; }
[[ $number =~ ^[0-9]+$ ]] || { echo 'Error: number must be a positive integer.' >&2; exit 1; }
[[ $mastery =~ ^[1-5]$ ]] || { echo 'Error: mastery must be between 1 and 5.' >&2; exit 1; }

case "$language" in
    py|python) language='Python' ;;
    c++|cpp) language='C++' ;;
    *) echo 'Error: language must be python or cpp.' >&2; exit 1 ;;
esac

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
member_file="$project_root/progress/$github_id.md"
[[ -f $member_file ]] || { echo "Error: member page does not exist: progress/$github_id.md" >&2; exit 1; }

problem_dir=''
while IFS= read -r -d '' candidate; do
    [[ -z $problem_dir ]] || { echo "Error: multiple directories found for problem $number." >&2; exit 1; }
    problem_dir=$candidate
done < <(find "$project_root" -mindepth 1 -maxdepth 1 -type d \
    \( -name "$number. * (Easy)" -o -name "$number. * (Medium)" -o -name "$number. * (Hard)" \) -print0)

[[ -n $problem_dir && -f $problem_dir/README.md ]] || { echo "Error: problem $number does not exist." >&2; exit 1; }

if grep -qE "^\| \[$number\. " "$member_file"; then
    echo "Error: problem $number already exists in progress/$github_id.md; update its row directly." >&2
    exit 1
fi

directory=$(basename "$problem_dir")
today=$(date +%F)
note=${note//$'\n'/ }
note=${note//|/&#124;}
row="| [$directory](<../$directory/README.md>) | $today | YYYY-MM-DD | $mastery | $language | $note |"
temporary_file=$(mktemp)
trap 'rm -f "$temporary_file"' EXIT

awk -v new_number="$number" -v new_row="$row" '
    /^\|---\|:---:/ { in_records = 1; print; next }
    in_records && /^\| \[[0-9]+\./ {
        current = $0
        sub(/^\| \[/, "", current)
        sub(/\..*$/, "", current)
        if (!inserted && current + 0 > new_number + 0) {
            print new_row
            inserted = 1
        }
        print
        next
    }
    in_records && /^## 待複習$/ {
        if (!inserted) print new_row
        inserted = 1
        in_records = 0
    }
    { print }
    END {
        if (!inserted) exit 2
    }
' "$member_file" > "$temporary_file" || {
    echo 'Error: could not find the progress table structure.' >&2
    exit 1
}

mv "$temporary_file" "$member_file"
trap - EXIT
echo "Added: problem $number to progress/$github_id.md ($language, mastery $mastery, $today)"
