# 快速查看系统信息
sysinfo() {
  echo "=== System Information ==="
  echo "OS: $(sw_vers -productName) $(sw_vers -productVersion)"
  echo "Kernel: $(uname -r)"
  echo "Architecture: $(uname -m)"
  echo "Hostname: $(hostname)"
  echo "Uptime: $(uptime | awk '{print $3, $4}' | cut -d',' -f1)"
  echo "Shell: $SHELL"
  echo "Terminal: $TERM"
  echo "CPU: $(sysctl -n machdep.cpu.brand_string)"
  echo "Memory: $(sysctl -n hw.memsize | awk '{print $1/1024/1024/1024 " GB"}')"
  echo "Disk Usage:"
  df -h / | tail -1 | awk '{print "  Used: " $3 "/" $2 " (" $5 ")"}'
}

# 快速查看进程信息
psinfo() {
  if [ -z "$1" ]; then
    echo "Usage: psinfo <process_name_or_pid>"
    return 1
  fi
  
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    ps -p "$1" -o pid,ppid,cmd,%mem,%cpu,etime
  else
    ps aux | grep -i "$1" | grep -v grep
  fi
}

# 快速监控资源使用
monitor() {
  if [ "$1" = "cpu" ]; then
    top -o cpu -s 5
  elif [ "$1" = "mem" ]; then
    top -o mem -s 5
  else
    echo "Usage: monitor [cpu|mem]"
  fi
}

# 快速查看最近的错误日志
logs() {
  if [ -f /var/log/system.log ]; then
    tail -f /var/log/system.log
  else
    echo "System log not found"
  fi
}

# 快速清理缓存
clean_cache() {
  echo "Cleaning system caches..."
  sudo rm -rf /Library/Caches/*
  sudo rm -rf ~/Library/Caches/*
  echo "Cache cleaned"
}

# 快速查看磁盘使用详情
disk_usage() {
  echo "=== Disk Usage ==="
  df -h
  echo ""
  echo "=== Largest Directories ==="
  du -h ~ 2>/dev/null | sort -hr | head -10
}