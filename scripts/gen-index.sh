#!/usr/bin/env bash
# Regenerate one index.md per subject dir under content/ (root content/index.md is hand-maintained, not touched).
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

for d in "$CONTENT"/*/; do
  name="$(basename "$d")"
  is_skipped "$name" && continue

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
