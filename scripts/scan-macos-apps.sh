#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scan-macos-apps.sh [--with-brew]

Scan macOS application bundles in /Applications and ~/Applications.
Use --with-brew to append the installed Homebrew Cask list.
EOF
}

with_brew=0
if [[ "${1:-}" == "--with-brew" ]]; then
  with_brew=1
elif [[ $# -gt 0 ]]; then
  usage
  exit 1
fi

printf 'app_name	display_name	bundle_id	version	path
'

for dir in /Applications "$HOME/Applications"; do
  [[ -d "$dir" ]] || continue

  while IFS= read -r app; do
    [[ -d "$app" ]] || continue
    info="$app/Contents/Info.plist"

    app_name="$(basename "$app" .app)"
    display_name=""
    bundle_id=""
    version=""

    if [[ -f "$info" ]]; then
      display_name="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleDisplayName' "$info" 2>/dev/null || true)"
      bundle_id="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$info" 2>/dev/null || true)"
      version="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$info" 2>/dev/null || true)"
    fi

    display_name="${display_name:-$app_name}"
    printf '%s	%s	%s	%s	%s
' "$app_name" "$display_name" "$bundle_id" "$version" "$app"
  done < <(find "$dir" -maxdepth 1 -type d -name '*.app' -print | sort -f)
done

if [[ "$with_brew" -eq 1 ]] && command -v brew >/dev/null 2>&1; then
  printf '
--- Homebrew Casks ---
'
  brew list --cask 2>/dev/null | sort -f
fi
