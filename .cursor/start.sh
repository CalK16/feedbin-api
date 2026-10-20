#!/usr/bin/env bash
set -euo pipefail

PORT="${DOCS_PORT:-8080}"
DOC_ROOT="/workspace"

if curl -sf "http://127.0.0.1:${PORT}/README.md" | grep -q 'Feedbin API'; then
  echo "Documentation server already listening on port ${PORT}"
  exit 0
fi

echo "Starting documentation server on 0.0.0.0:${PORT}"
exec python3 -m http.server "$PORT" --bind 0.0.0.0 --directory "$DOC_ROOT"
