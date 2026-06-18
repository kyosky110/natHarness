#!/usr/bin/env bash
set -euo pipefail

skill_name="agent-harness"
repo_slug="${NAT_HARNESS_REPO:-kyosky110/natHarness}"
repo_ref="${NAT_HARNESS_REF:-main}"
codex_home="${CODEX_HOME:-$HOME/.codex}"
skills_dir="$codex_home/skills"
target_dir="$skills_dir/$skill_name"
tmp_dir=""

cleanup() {
  if [[ -n "$tmp_dir" && -d "$tmp_dir" ]]; then
    rm -rf "$tmp_dir"
  fi
}
trap cleanup EXIT

resolve_repo_root() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  if [[ -f "$script_dir/../SKILL.md" && -d "$script_dir/../templates" ]]; then
    cd "$script_dir/.." && pwd
    return
  fi

  tmp_dir="$(mktemp -d)"
  local archive="$tmp_dir/source.tar.gz"
  local extract_dir="$tmp_dir/source"
  local url="https://github.com/$repo_slug/archive/$repo_ref.tar.gz"

  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required for remote installation." >&2
    exit 1
  fi

  mkdir -p "$extract_dir"
  echo "Downloading https://github.com/$repo_slug ($repo_ref)..."
  curl -fsSL "$url" -o "$archive"
  tar -xzf "$archive" -C "$extract_dir" --strip-components=1
  cd "$extract_dir" && pwd
}

repo_root="$(resolve_repo_root)"

if [[ ! -f "$repo_root/SKILL.md" ]]; then
  echo "Missing SKILL.md in repository root: $repo_root" >&2
  exit 1
fi

if [[ ! -d "$repo_root/templates" ]]; then
  echo "Missing templates directory in repository root: $repo_root" >&2
  exit 1
fi

mkdir -p "$skills_dir"

if [[ -e "$target_dir" ]]; then
  timestamp="$(date +%Y%m%d%H%M%S)"
  backup_dir="$skills_dir/${skill_name}.backup.$timestamp"
  cp -R "$target_dir" "$backup_dir"
  echo "Backed up existing skill to: $backup_dir"
fi

mkdir -p "$target_dir"
cp "$repo_root/SKILL.md" "$target_dir/SKILL.md"
rm -rf "$target_dir/templates"
cp -R "$repo_root/templates" "$target_dir/templates"

echo "Installed $skill_name to: $target_dir"
