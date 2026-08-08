#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo 'Usage: ./scripts/new-member.sh <github-id> <display-name>' >&2
    exit 1
fi

github_id=$1
display_name=$2

if [[ ! $github_id =~ ^[A-Za-z0-9-]+$ ]]; then
    echo 'Error: GitHub ID may contain only letters, numbers, and hyphens.' >&2
    exit 1
fi

if [[ -z $display_name || $display_name == *'/'* ]]; then
    echo 'Error: display name cannot be empty or contain a slash.' >&2
    exit 1
fi

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
target="$project_root/progress/$github_id.md"

if [[ -e $target ]]; then
    echo "Error: already exists: $target" >&2
    exit 1
fi

escaped_name=$(printf '%s' "$display_name" | sed 's/[\\/&]/\\&/g')
sed \
    -e "s/{GitHub ID}/$github_id/g" \
    -e "s/{顯示名稱}/$escaped_name/g" \
    "$project_root/progress/TEMPLATE.md" > "$target"

echo "Created: $target"
echo 'Next: add your page to progress/README.md'
