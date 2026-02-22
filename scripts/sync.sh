#!/usr/bin/env bash

###############################################################################
# sync.sh
# -----------------------------------------------------------------------------
# Purpose:
#   Synchronize published Markdown notes from iCloud Notes directory
#   to the blog content directory inside this project.
#
# Strategy:
#   1. Only files with YAML frontmatter containing `publish: true` are synced.
#   2. Only .md and .mdx files are processed.
#   3. A manifest file tracks previously synced files to safely remove
#      unpublished content from the target directory.
#
# Usage:
#   ./scripts/sync.sh
#
# Optional environment override:
#   NOTES_DIR=/custom/path ./scripts/sync.sh
#
###############################################################################

set -euo pipefail

###############################################################################
# Configuration
###############################################################################

# Source directory (default: iCloud Notes root)
NOTES_DIR="${NOTES_DIR:-$HOME/Library/Mobile Documents/com~apple~CloudDocs/Documents/Notes}"

# Destination directory (relative to this script location)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BLOG_DIR="$PROJECT_ROOT/site/src/content/blog"

# Manifest files to track synchronized files
CURRENT_MANIFEST="$BLOG_DIR/.current_synced_manifest.txt"
PREV_MANIFEST="$BLOG_DIR/.prev_synced_manifest.txt"

###############################################################################
# Preparation
###############################################################################

mkdir -p "$BLOG_DIR"
: > "$CURRENT_MANIFEST"

###############################################################################
# Function: is_published
# Checks whether a file contains YAML frontmatter with `publish: true`
###############################################################################

is_published() {
  local file="$1"

  awk '
    NR==1 && $0=="---" {in_frontmatter=1; next}
    in_frontmatter && $0=="---" {exit}
    in_frontmatter && $0 ~ /^[[:space:]]*publish:[[:space:]]*true[[:space:]]*$/ {found=1}
    END {exit(found?0:1)}
  ' "$file"
}

###############################################################################
# Synchronization Logic
###############################################################################

shopt -s nullglob

for file in "$NOTES_DIR"/*.md "$NOTES_DIR"/*.mdx; do

  if is_published "$file"; then

    filename="$(basename "$file")"

    # Copy file to blog directory (overwrite if exists)
    cp -f "$file" "$BLOG_DIR/$filename"

    echo "$filename" >> "$CURRENT_MANIFEST"
  fi

done

###############################################################################
# Cleanup: remove files that were previously synced but are no longer published
###############################################################################

if [[ -f "$PREV_MANIFEST" ]]; then

  while IFS= read -r old_file; do

    if ! grep -qxF "$old_file" "$CURRENT_MANIFEST"; then
      rm -f "$BLOG_DIR/$old_file"
    fi

  done < "$PREV_MANIFEST"

fi

cp -f "$CURRENT_MANIFEST" "$PREV_MANIFEST"

###############################################################################
# Completion Message
###############################################################################

echo "Synchronization complete."
echo "Published files synced: $(wc -l < "$CURRENT_MANIFEST")"
#!/usr/bin/env bash

###############################################################################
# sync.sh
# -----------------------------------------------------------------------------
# 功能说明：
#   将 iCloud Notes 目录中的“已发布”Markdown文章
#   同步到本项目的博客内容目录。
#
# 同步规则：
#   1. 仅同步 YAML frontmatter 中包含 `publish: true` 的文件。
#   2. 仅处理 .md 与 .mdx 文件。
#   3. 使用 manifest 文件记录历史同步结果，
#      自动删除已取消发布的文章。
#
# 使用方式：
#   ./scripts/sync.sh
#
# 可选参数：
#   自定义 Notes 目录：
#   NOTES_DIR=/custom/path ./scripts/sync.sh
###############################################################################

set -euo pipefail

###############################################################################
# 配置区域
###############################################################################

# 源目录（默认使用 iCloud Notes 根目录）
NOTES_DIR="${NOTES_DIR:-$HOME/Library/Mobile Documents/com~apple~CloudDocs/Documents/Notes}"

# 目标博客目录（根据脚本位置自动推导项目根目录）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BLOG_DIR="$PROJECT_ROOT/site/src/content/blog"

# manifest 文件（用于记录同步状态）
CURRENT_MANIFEST="$BLOG_DIR/.current_synced_manifest.txt"
PREV_MANIFEST="$BLOG_DIR/.prev_synced_manifest.txt"

###############################################################################
# 初始化
###############################################################################

# 若目录不存在则创建
mkdir -p "$BLOG_DIR"

# 清空当前 manifest
: > "$CURRENT_MANIFEST"

###############################################################################
# 函数：is_published
# 判断文件是否包含 publish: true
###############################################################################

is_published() {
  local file="$1"

  awk '
    # 第一行必须是 --- 才认为有 frontmatter
    NR==1 && $0=="---" {in_frontmatter=1; next}

    # 遇到第二个 --- 结束 frontmatter 区域
    in_frontmatter && $0=="---" {exit}

    # 在 frontmatter 内匹配 publish: true
    in_frontmatter && $0 ~ /^[[:space:]]*publish:[[:space:]]*true[[:space:]]*$/ {found=1}

    END {exit(found?0:1)}
  ' "$file"
}

###############################################################################
# 同步逻辑
###############################################################################

shopt -s nullglob

for file in "$NOTES_DIR"/*.md "$NOTES_DIR"/*.mdx; do

  # 若文章标记为 publish: true
  if is_published "$file"; then

    filename="$(basename "$file")"

    # 复制到博客目录（存在则覆盖）
    cp -f "$file" "$BLOG_DIR/$filename"

    # 记录本次同步文件名
    echo "$filename" >> "$CURRENT_MANIFEST"
  fi

done

###############################################################################
# 清理逻辑
# 删除之前同步过，但现在已取消 publish 的文件
###############################################################################

if [[ -f "$PREV_MANIFEST" ]]; then

  while IFS= read -r old_file; do

    # 如果旧文件不在本次同步列表中，则删除
    if ! grep -qxF "$old_file" "$CURRENT_MANIFEST"; then
      rm -f "$BLOG_DIR/$old_file"
    fi

  done < "$PREV_MANIFEST"

fi

# 更新历史 manifest
cp -f "$CURRENT_MANIFEST" "$PREV_MANIFEST"

###############################################################################
# 完成提示
###############################################################################

echo "同步完成。"
echo "已发布文章数量: $(wc -l < \"$CURRENT_MANIFEST\")"