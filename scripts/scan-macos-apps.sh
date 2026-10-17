#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scan-macos-apps.sh [--with-brew | --format tsv | --report FILE]

Scan top-level application bundles in /Applications and ~/Applications,
including bundles nested one directory deeper.

Options:
  --with-brew       Append the installed Homebrew Cask list.
  --format tsv      Print tab-separated metadata (default).
  --report FILE     Write a Markdown snapshot to FILE.
  -h, --help        Show this help.
EOF
}

with_brew=0
format=tsv
report=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --with-brew)
      with_brew=1
      ;;
    --format)
      [[ $# -ge 2 ]] || { usage; exit 1; }
      format="$2"
      shift
      ;;
    --report)
      [[ $# -ge 2 ]] || { usage; exit 1; }
      report="$2"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 1
      ;;
  esac
  shift
done

[[ "$format" == "tsv" ]] || { usage; exit 1; }

plist_value() {
  local plist="$1" key="$2"
  [[ -f "$plist" ]] || return 0
  /usr/libexec/PlistBuddy -c "Print :$key" "$plist" 2>/dev/null || true
}

app_paths=()
for dir in /Applications "$HOME/Applications"; do
  [[ -d "$dir" ]] || continue
  while IFS= read -r app; do
    app_paths+=("$app")
  done < <(
    find "$dir" -mindepth 1 -maxdepth 2 -type d -name '*.app' \
      ! -path '*/Contents/*' -print
  )
done

if [[ ${#app_paths[@]} -eq 0 ]]; then
  echo "No application bundles found." >&2
  exit 1
fi

IFS=$'\n' app_paths=($(printf '%s\n' "${app_paths[@]}" | sort -f))
unset IFS

signature_status() {
  local app="$1" verify spctl spctl_bin details
  if [[ -x /usr/sbin/spctl ]]; then
    spctl_bin=/usr/sbin/spctl
  elif [[ -x /usr/bin/spctl ]]; then
    spctl_bin=/usr/bin/spctl
  else
    spctl_bin=""
  fi

  if ! verify="$(/usr/bin/codesign --verify --deep --strict "$app" 2>&1)"; then
    if [[ "$verify" == *"resource fork"* || "$verify" == *"Finder information"* ]]; then
      printf 'Developer ID（资源分叉告警）'
    elif [[ "$verify" == *"invalid signature"* || "$verify" == *"modified"* ]]; then
      printf 'Developer ID（深度校验异常）'
    else
      printf '签名校验失败'
    fi
    return
  fi

  if [[ -n "$spctl_bin" ]] && spctl="$("$spctl_bin" --assess --type execute --verbose=2 "$app" 2>&1)"; then
    case "$spctl" in
      *"Notarized Developer ID"*) printf 'Notarized Developer ID' ;;
      *"Mac App Store"*) printf 'Mac App Store' ;;
      *"Apple System"*) printf 'Apple System' ;;
      *) printf '已通过 Gatekeeper' ;;
    esac
  elif details="$(/usr/bin/codesign -dv --verbose=2 "$app" 2>&1 || true)" &&
    grep -q 'Signature=adhoc' <<<"$details"; then
    printf 'Ad-hoc，Gatekeeper 拒绝'
  else
    printf 'Gatekeeper 拒绝'
  fi
}

source_label() {
  local app="$1"
  local bundle_id
  bundle_id="$(plist_value "$app/Contents/Info.plist" CFBundleIdentifier)"
  local app_name
  app_name="$(basename "$app" .app)"

  case "$bundle_id" in
    com.tencent.xinWeChat) printf 'Mac App Store' ; return ;;
    org.openvpn.client.app) printf '官方 PKG' ; return ;;
    net.openvpn.uninstaller) printf '官方 PKG 附带' ; return ;;
  esac

  local cask
  for cask in ghostty localsend orbstack reasonix stats visual-studio-code; do
    if [[ -d "/opt/homebrew/Caskroom/$cask" ]]; then
      local candidate=""
      case "$cask" in
        ghostty) candidate="Ghostty" ;;
        localsend) candidate="LocalSend" ;;
        orbstack) candidate="OrbStack" ;;
        reasonix) candidate="Reasonix" ;;
        stats) candidate="Stats" ;;
        visual-studio-code) candidate="Visual Studio Code" ;;
      esac
      if [[ "$app_name" == "$candidate" ]]; then
        printf 'Homebrew Cask'
        return
      fi
    fi
  done

  printf '独立安装'
}

app_name() {
  local app="$1"
  local name
  name="$(plist_value "$app/Contents/Info.plist" CFBundleDisplayName)"
  if [[ -z "$name" ]]; then
    name="$(plist_value "$app/Contents/Info.plist" CFBundleName)"
  fi
  printf '%s' "${name:-$(basename "$app" .app)}"
}

size_of() {
  local app="$1"
  du -sh "$app" 2>/dev/null | awk '{print $1}'
}

if [[ -n "$report" ]]; then
  {
    printf '# 本机已安装应用归档\n\n'
    printf '> 扫描时间：%s\n' "$(date '+%Y-%m-%d %H:%M %Z')"
    printf '> 扫描范围：`/Applications` 与 `~/Applications`（含一层子目录）\n'
    printf '> 共 %d 个应用包\n\n' "${#app_paths[@]}"
    printf '| 应用 | 版本 | Bundle ID | 安装位置 | 来源 / 安装方式 | 签名状态 | 大小 |\n'
    printf '|---|---|---|---|---|---|---|\n'
    for app in "${app_paths[@]}"; do
      name="$(app_name "$app")"
      version="$(plist_value "$app/Contents/Info.plist" CFBundleShortVersionString)"
      bundle_id="$(plist_value "$app/Contents/Info.plist" CFBundleIdentifier)"
      source="$(source_label "$app")"
      signature="$(signature_status "$app")"
      size="$(size_of "$app")"
      printf '| %s | %s | `%s` | `%s` | %s | %s | %s |\n' \
        "$name" "${version:-—}" "${bundle_id:-—}" "$app" "$source" "$signature" "$size"
    done
  } > "$report"
  echo "Wrote $report" >&2
  exit 0
fi

printf 'app_name\tdisplay_name\tbundle_id\tversion\tpath\tsource\tsignature\n'
for app in "${app_paths[@]}"; do
  name="$(basename "$app" .app)"
  display_name="$(app_name "$app")"
  version="$(plist_value "$app/Contents/Info.plist" CFBundleShortVersionString)"
  bundle_id="$(plist_value "$app/Contents/Info.plist" CFBundleIdentifier)"
  source="$(source_label "$app")"
  signature="$(signature_status "$app")"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$name" "$display_name" "${bundle_id:-—}" "${version:-—}" "$app" "$source" "$signature"
done

if [[ "$with_brew" -eq 1 ]] && command -v brew >/dev/null 2>&1; then
  printf '\n--- Homebrew Casks ---\n'
  brew list --cask 2>/dev/null | sort -f || true
fi
