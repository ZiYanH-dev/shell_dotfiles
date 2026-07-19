#!/usr/bin/env zsh

# 检查是否在 zsh 中运行
if [ -z "$ZSH_VERSION" ]; then
  echo "❌ 错误：此配置文件需要在 zsh 中运行！"
  echo "请使用：source loader.zsh"
  echo "或者确保你的 shell 是 zsh"
  return 1 2>/dev/null || exit 1
fi

# 获取.zsh目录的绝对路径
ZSH_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"

echo "📂 Loading from: $ZSH_DIR"
# echo "Contents of $ZSH_DIR:"
# ls -la "$ZSH_DIR"

# 自动加载当前目录下所有文件夹里的 zsh 文件
# 使用 find 命令来可靠地遍历文件夹
while IFS= read -r -d '' folder; do
  # 获取文件夹的 basename，检查是否以 . 开头
  folder_name="$(basename "$folder")"
  if [[ "$folder_name" == .* ]]; then
    # echo "⏭️  Skipping hidden folder: $folder"
    continue
  fi
  
  # echo "📁 Processing folder: $folder"
  
  # 使用 find 找到该文件夹下所有 .zsh 文件
  while IFS= read -r -d '' file; do
    if [ -r "$file" ] && [ -f "$file" ]; then
      # echo "  📄 Loading: $file"
      source "$file"
    fi
  done < <(find "$folder" -maxdepth 1 -name "*.zsh" -type f -print0)
  
done < <(find "$ZSH_DIR" -maxdepth 1 -type d ! -name "$(basename "$ZSH_DIR")" -print0 | sort -z)

echo "✅ All configurations loaded!"
