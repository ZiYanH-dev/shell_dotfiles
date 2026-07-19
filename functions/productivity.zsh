# 快速创建目录并进入
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# 查找并杀死进程
killport() {
  lsof -ti:$1 | xargs kill -9
}

# 快速备份文件
backup() {
  cp "$1" "$1.backup-$(date +%Y%m%d_%H%M%S)"
}

# 快速查找文件
findfile() {
  local search_dir="."
  local search_pattern

  if [ $# -eq 1 ]; then
    search_pattern="$1"
  elif [ $# -eq 2 ]; then
    search_dir="$1"
    search_pattern="$2"
  else
    echo "Usage: findfile [directory] pattern"
    echo "Example: findfile ~/Documents test"
    return 1
  fi

  find "$search_dir" -type f -name "*$search_pattern*" 2>/dev/null
}

# 快速查找目录
finddir() {
  local search_dir="."
  local search_pattern

  if [ $# -eq 1 ]; then
    search_pattern="$1"
  elif [ $# -eq 2 ]; then
    search_dir="$1"
    search_pattern="$2"
  else
    echo "Usage: finddir [directory] pattern"
    echo "Example: finddir ~/Documents test"
    return 1
  fi

  find "$search_dir" -type d -name "*$search_pattern*" 2>/dev/null
}

# 显示文件大小
filesize() {
  du -h "$1" | cut -f1
}

# 快速创建并编辑文件
edit() {
  touch "$1" && code "$1"
}

# 快速查看端口占用
portusage() {
  lsof -i :$1
}

# 清理重复的历史记录
cleanhistory() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}