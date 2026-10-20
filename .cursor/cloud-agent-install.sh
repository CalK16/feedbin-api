#!/usr/bin/env bash
set -euo pipefail

# Documentation-only repository: verify expected markdown files exist.
missing=0
for f in README.md content/authentication.md content/subscriptions.md content/entries.md; do
  if [[ ! -f "$f" ]]; then
    echo "Missing required doc: $f" >&2
    missing=1
  fi
done

count="$(find content -maxdepth 1 -name '*.md' | wc -l)"
if [[ "$count" -lt 10 ]]; then
  echo "Expected at least 10 content/*.md files, found $count" >&2
  exit 1
fi

echo "Feedbin API docs OK ($count content pages)"
