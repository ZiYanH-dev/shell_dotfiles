# 系统管理命令大全

进程、资源、系统信息相关命令，适用于 zsh/bash shell。

## 进程管理

### `ps` - 查看进程状态
```bash
ps aux                                    # 查看所有进程（BSD风格）
ps -ef                                    # 查看所有进程（System V风格）
ps aux | grep python                      # 搜索特定进程
ps -p 1234                                # 查看指定PID
ps -u username                            # 查看指定用户进程
```

### `top` / `htop` - 实时进程监控
```bash
top                                       # 启动top（q退出）
# top内快捷键: M(按内存), P(按CPU), k(杀死进程)
htop                                      # 增强版（需安装，更友好）
```

### `kill` - 发送信号终止进程
```bash
kill 1234                                 # 发送SIGTERM（优雅终止）
kill -9 1234                              # 发送SIGKILL（强制终止）
kill -l                                   # 列出所有信号
killall nginx                             # 按进程名终止
pkill -f "python.*server"                 # 按模式匹配终止
```

### `bg` / `fg` / `jobs` - 作业控制
```bash
jobs                                      # 列出后台作业
fg %1                                     # 将作业1切回前台
bg %1                                     # 将作业1切回后台
Ctrl+Z                                    # 暂停当前前台进程
```

## 系统资源

### `df` - 磁盘空间使用
```bash
df -h                                     # 人类可读格式
df -i                                     # 显示inode使用情况
df /path                                  # 查看指定路径所在分区
```

### `du` - 目录/文件大小
```bash
du -sh /path                              # 汇总显示目录大小
du -h --max-depth=1 /path                 # 仅显示一级子目录
du -ah /path | sort -rh | head -10        # 找最大10个文件/目录
```

### `free` - 内存使用（Linux）
```bash
free -h                                   # 人类可读内存信息
free -m                                   # 以MB为单位
```

### `uptime` - 系统运行时间
```bash
uptime                                    # 显示运行时间+负载
```

### `vmstat` / `iostat` - 系统性能监控
```bash
vmstat 1 5                                # 每秒1次，共5次
iostat -x 1                               # 详细IO统计，每秒刷新
```

## 系统信息

### `uname` - 系统信息
```bash
uname -a                                  # 所有信息
uname -s                                  # 内核名称
uname -r                                  # 内核版本
```

### `hostname` - 主机名
```bash
hostname                                  # 显示主机名
hostnamectl                               # systemd系统的主机名管理
```

### `who` / `w` / `last` - 用户登录信息
```bash
who                                       # 当前登录用户
w                                         # 登录用户+活动
last                                      # 历史登录记录
lastlog                                   # 所有用户最后登录时间
```

### `date` - 日期时间
```bash
date                                      # 当前系统时间
date "+%Y-%m-%d %H:%M:%S"                 # 格式化输出
date -u                                   # UTC时间
```

## 用户与权限

### `id` / `groups` - 用户身份
```bash
id                                        # 当前用户UID/GID
id username                               # 指定用户信息
groups username                           # 用户所属组
```

### `sudo` - 提权执行
```bash
sudo command                              # 以root执行命令
sudo -i                                   # 切换到root shell
sudo -u otheruser command                 # 以其他用户执行
```

### `su` - 切换用户
```bash
su - username                             # 切换用户并加载环境
su -c "command" username                  # 以用户身份执行单条命令
```

## 服务与启动项

### `launchctl` - macOS 服务管理
```bash
launchctl list                            # 列出已加载服务
launchctl load ~/Library/LaunchAgents/xxx.plist
launchctl unload ~/Library/LaunchAgents/xxx.plist
```

### `systemctl` - Linux systemd 服务管理
```bash
systemctl status service                  # 查看服务状态
systemctl start|stop|restart service      # 控制服务
systemctl enable service                  # 开机自启
systemctl list-units --type=service       # 列出所有服务
```

## 实用组合示例

```bash
# 查找占用CPU最高的进程
ps aux --sort=-%cpu | head -10

# 查找大文件（>100M）
find / -type f -size +100M 2>/dev/null | xargs ls -lh

# 监控磁盘IO
watch -n 1 'df -h; echo; iostat -x 1 1'

# 清理旧日志（保留最近7天）
find /var/log -name "*.log" -mtime +7 -delete
```

> 💡 **Zsh 技巧**: 使用 `zle` 和 `run-help` 获取命令帮助
> ```bash
> autoload -Uz run-help && run-help ps    # 查看ps命令帮助
> ```
