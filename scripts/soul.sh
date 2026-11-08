#!/usr/bin/env bash
# Manage agent personalities (souls).
#   soul.sh list                         list recorded souls
#   soul.sh new <name>                   start a new soul from TEMPLATE.md
#   soul.sh use <name> [workspace]       install a soul into an agent workspace
#   soul.sh record <name> [workspace]    copy an agent's evolved soul back into this repo
# workspace defaults to $OPENCLAW_WORKSPACE, then ~/.openclaw/workspace
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOULS="$ROOT/souls"
WS="${3:-${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}}"
FILES=(SOUL.md IDENTITY.md)

die() { echo "error: $*" >&2; exit 1; }
need_name() { [[ -n "${1:-}" ]] || die "missing <name>"; [[ "$1" =~ ^[a-z0-9-]+$ ]] || die "name must be lowercase letters, digits or -"; }

cmd="${1:-list}"; name="${2:-}"
case "$cmd" in
  list)
    for d in "$SOULS"/*/; do
      n="$(basename "$d")"
      role="$(grep -m1 '\*\*Role:\*\*' "$d/IDENTITY.md" 2>/dev/null | sed 's/.*\*\*Role:\*\* *//')"
      printf '%-12s %s\n' "$n" "$role"
    done ;;
  new)
    need_name "$name"; dir="$SOULS/$name"
    [[ -e "$dir" ]] && die "soul '$name' already exists"
    mkdir -p "$dir"
    sed "s/<Name>/${name^}/" "$ROOT/TEMPLATE.md" > "$dir/SOUL.md"
    printf -- '- **Name:** %s\n- **Emoji:** \n- **Role:** \n' "${name^}" > "$dir/IDENTITY.md"
    echo "created $dir — edit SOUL.md and IDENTITY.md, then commit" ;;
  use)
    need_name "$name"; dir="$SOULS/$name"
    [[ -d "$dir" ]] || die "no soul '$name' (try: soul.sh list)"
    mkdir -p "$WS"
    for f in "${FILES[@]}"; do
      [[ -f "$dir/$f" ]] || continue
      if [[ -f "$WS/$f" ]] && ! cmp -s "$dir/$f" "$WS/$f"; then
        cp "$WS/$f" "$WS/$f.bak.$(date +%Y%m%d%H%M%S)"
      fi
      cp "$dir/$f" "$WS/$f"
    done
    echo "$name" > "$WS/.active-soul"
    echo "installed '$name' into $WS (start a new session to pick it up)" ;;
  record)
    need_name "$name"; dir="$SOULS/$name"
    [[ -f "$WS/SOUL.md" ]] || die "no SOUL.md in $WS"
    mkdir -p "$dir"
    for f in "${FILES[@]}"; do [[ -f "$WS/$f" ]] && cp "$WS/$f" "$dir/$f"; done
    echo "recorded $WS into $dir"
    (cd "$ROOT" && git --no-pager diff --stat -- "souls/$name" 2>/dev/null) || true ;;
  *) die "unknown command '$cmd' (list|new|use|record)" ;;
esac
