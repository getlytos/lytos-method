#!/usr/bin/env bash
# Sync root Lytos files into the starter template.
# Run this after editing LYTOS.md, rules/, or skills/ at the repo root.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STARTER="$ROOT/starter/.lytos"

copy() {
  local src="$1" dst="$2"
  if ! diff -q "$src" "$dst" > /dev/null 2>&1; then
    cp "$src" "$dst"
    echo "  synced: $dst"
  fi
}

echo "Syncing starter template..."

copy "$ROOT/LYTOS.md"                    "$STARTER/LYTOS.md"
copy "$ROOT/rules/default-rules.md"      "$STARTER/rules/default-rules.md"

echo "Done."
