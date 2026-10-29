#!/usr/bin/env bash
# Cria symlinks de todas as skills (exceto em-andamento) em ~/.claude/skills.
# Um `git pull` neste repo atualiza as skills instaladas. Rode de novo ao
# adicionar, remover ou renomear uma skill.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$DEST"

find "$REPO/skills" -name SKILL.md -not -path "*/em-andamento/*" | while read -r f; do
  dir="$(dirname "$f")"
  name="$(basename "$dir")"
  target="$DEST/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "pulei $name: $target já existe e não é symlink"
    continue
  fi
  ln -sfn "$dir" "$target"
  echo "ok $name -> $dir"
done
