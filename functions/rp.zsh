# rp — realpath + 复制到剪贴板，带当前目录文件建议（fzf）

rp() {
  # 没有参数时：用 fzf 列出当前目录文件/目录供选择
  if [ $# -eq 0 ]; then
    if ! command -v fzf >/dev/null 2>&1; then
      echo "⚠️ 未安装 fzf，回退为手动模式：rp <文件>"
      return 1
    fi
    local f
    f=$(fd --hidden --no-ignore --type f --type d . | fzf --prompt="复制路径> ") || return
    local p
    p=$(realpath "$f")
    echo "$p" | pbcopy
    echo "✅ 已复制: $p"
    return
  fi

  # 有参数：直接 realpath 每个参数并复制（最后一个覆盖剪贴板）
  local p
  for arg in "$@"; do
    p=$(realpath "$arg")
    echo "$p" | pbcopy
    echo "$p"
  done
}


alias rp.='rp .'