#!/usr/bin/env bash
# Regenerate content/index.md and one index.md per subject dir under content/.
# Usage: ./scripts/gen-index.sh
set -euo pipefail
cd "$(dirname "$0")/.."

CONTENT=content
SKIP_DIRS=("Files")

is_skipped() {
  local name="$1"
  for s in "${SKIP_DIRS[@]}"; do
    [ "$name" = "$s" ] && return 0
  done
  return 1
}

subjects=()
for d in "$CONTENT"/*/; do
  name="$(basename "$d")"
  is_skipped "$name" && continue
  subjects+=("$name")

  out="$d/index.md"
  {
    echo "---"
    echo "title: $name"
    echo "---"
    echo
    echo "# $name"
    echo
    find "$d" -maxdepth 1 -iname "*.md" ! -iname "index.md" -printf "%f\n" \
      | sort \
      | sed 's/\.md$//' \
      | sed 's/^/- [[/;s/$/]]/'
  } > "$out"
  echo "wrote $out"
done

IFS=$'\n' subjects=($(sort <<<"${subjects[*]}"))
unset IFS

{
  echo "---"
  echo "title: Welcome to My Obsidian"
  echo "---"
  echo
  echo "This are where to begin with"
  echo
  for name in "${subjects[@]}"; do
    echo "- $name: [[$name/index|$name]]"
  done
} > "$CONTENT/index.md"
echo "wrote $CONTENT/index.md"
