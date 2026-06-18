#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_name="agent-harness"
codex_home="${CODEX_HOME:-$HOME/.codex}"
skills_dir="$codex_home/skills"
target_dir="$skills_dir/$skill_name"

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
