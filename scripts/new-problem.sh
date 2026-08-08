#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
    echo 'Usage: ./scripts/new-problem.sh <number> <title> <Easy|Medium|Hard>' >&2
    exit 1
fi

number=$1
title=$2
difficulty=$3

if [[ ! $number =~ ^[0-9]+$ ]]; then
    echo 'Error: number must be a positive integer.' >&2
    exit 1
fi

if [[ -z $title || $title == */* ]]; then
    echo 'Error: title cannot be empty or contain a slash.' >&2
    exit 1
fi

case "$difficulty" in
    Easy|Medium|Hard) ;;
    *) echo 'Error: difficulty must be Easy, Medium, or Hard.' >&2; exit 1 ;;
esac

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
problem_dir="$project_root/$number. $title ($difficulty)"
target="$problem_dir/README.md"

if [[ -e $problem_dir ]]; then
    echo "Error: already exists: $problem_dir" >&2
    exit 1
fi

slug=$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E "s/[^a-z0-9]+/-/g; s/^-|-$//g")
escaped_title=$(printf '%s' "$title" | sed 's/[\\/&]/\\&/g')
mkdir "$problem_dir"
sed \
    -e "s/{題號}/$number/g" \
    -e "s/{題名}/$escaped_title/g" \
    -e "s/{難度}/$difficulty/g" \
    -e "s|{題目連結}|https://leetcode.com/problems/$slug/|g" \
    "$project_root/0. TEMPLATE/README.md" > "$target"

echo "Created: $target"
echo 'Next: finish a solution, then run ./scripts/update-index.sh <number> <python|cpp>'
