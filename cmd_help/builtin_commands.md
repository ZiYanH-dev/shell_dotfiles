# Shell 内置命令大全

Zsh/Bash 内置命令（无需外部程序），执行更快，功能核心。

> 💡 **如何区分**: 用 `type command` 查看，显示 `builtin` 即为内置命令

---

## 作业与进程控制

### `jobs` - 列出后台作业
```bash
jobs -l                     # 显示PID
jobs -p                     # 仅显示PID
jobs %1                     # 查看指定作业
```

### `fg` / `bg` - 前台/后台切换
```bash
fg                          # 恢复最近的前台作业
fg %2                       # 恢复作业#2
bg %1                       # 将作业#1放到后台运行
```

### `kill` - 发送信号（内置版）
```bash
kill -l                     # 列出所有信号名称
kill -TERM 1234             # 优雅终止进程
kill %%                     # 终止当前作业
```

### `wait` - 等待进程完成
```bash
wait                        # 等待所有后台作业
wait 1234                   # 等待指定PID
wait %1                     # 等待作业#1
```

### `disown` - 移除作业控制
```bash
disown %1                   # 作业#1不再受shell管理（关闭终端不终止）
disown -h %1                # 仅移除hangup信号，仍可查看状态
```

---

## 目录栈与导航

### `pushd` / `popd` / `dirs` - 目录栈操作
```bash
pushd /path                 # 进入目录并压栈
pushd +1                    # 切换到栈中第1个目录（从0计数）
popd                        # 弹出栈顶并进入
dirs -v                     # 垂直显示目录栈
dirs -l                     # 显示完整路径
```

### `cd` - 切换目录（内置增强版）
```bash
cd -                        # 回到上一个目录
cd ~user                    # 切换到指定用户的home
cd $OLDPWD                  # 同 cd -
# Zsh: autocd 选项启用后可直接输入目录名进入
```

### `pwd` - 显示当前目录
```bash
pwd -P                      # 显示物理路径（解析所有符号链接）
pwd -L                      # 显示逻辑路径（默认，保留符号链接）
```

---

## 变量与环境

### `export` - 导出环境变量
```bash
export VAR=value            # 设置并导出
export VAR                  # 导出已存在的变量
export -f func_name         # 导出函数（子shell可用）
export -p                   # 列出所有导出变量
```

### `unset` - 删除变量/函数
```bash
unset VAR                   # 删除变量
unset -f func_name          # 删除函数
unset -v VAR                # 显式删除变量（更清晰）
```

### `readonly` / `typeset -r` - 声明只读
```bash
readonly VAR=value          # 声明后不可修改
readonly -p                 # 列出所有只读变量
typeset -rx PATH            # Zsh: 只读+导出
```

### `declare` / `typeset` - 变量属性（Bash/Zsh）
```bash
declare -i num=42           # 声明为整数
declare -a arr=(1 2 3)      # 声明为数组
declare -A map=([k]=v)      # 声明为关联数组（Bash 4+）
declare -x VAR=value        # 同 export
declare -p VAR              # 显示变量属性
# Zsh 中 typeset 功能相同
```

### `local` - 局部变量（函数内）
```bash
myfunc() {
  local tmp="value"         # 仅函数内可见
  local -i count=0          # 局部整数变量
}
```

---

## 执行与控制

### `eval` - 执行字符串作为命令
```bash
cmd="echo hello"
eval "$cmd"                 # 输出: hello
# ⚠️ 注意安全风险：不要 eval 用户输入
```

### `exec` - 替换当前shell或重定向FD
```bash
exec command                # 替换当前shell（不返回）
exec > output.txt           # 重定向后续所有输出
exec 3< input.txt           # 打开文件描述符3用于读取
exec 3>&-                   # 关闭文件描述符3
```

### `source` / `.` - 在当前shell执行脚本
```bash
source ~/.zshrc             # 加载配置（当前shell生效）
. ./script.sh               # 简写形式
source <(curl -s URL)       # 执行远程脚本（谨慎！）
```

### `command` - 绕过别名/函数执行外部命令
```bash
command ls                  # 执行真正的ls，忽略别名
command -v python           # 查找命令路径（比which可靠）
command -V python           # 显示命令详情
```

### `builtin` - 强制使用内置版本
```bash
builtin cd /tmp             # 确保使用内置cd
builtin echo -n "no newline"
```

### `enable` - 启用/禁用内置命令
```bash
enable -n cd                # 禁用内置cd（如有外部cd则用外部版）
enable -a                   # 列出所有内置命令
```

---

## 流程控制关键字（语法级内置）

> 这些是shell语法关键字，非独立命令

### 条件与循环
```bash
# if/elif/else
if [[ -f file.txt ]]; then
  echo "exists"
elif [[ -d file.txt ]]; then
  echo "is directory"
else
  echo "not found"
fi

# for 循环
for f in *.txt; do
  echo "$f"
done

# while 循环
while read -r line; do
  echo "Read: $line"
done < input.txt

# until 循环（条件为假时执行）
until [[ -f ready.flag ]]; do
  sleep 1
done

# case 多分支
case "$1" in
  start|run) do_start ;;
  stop) do_stop ;;
  *) echo "Usage: $0 {start|stop}" ;;
esac
```

### `select` - 生成菜单
```bash
PS3="Choose: "
select opt in "Option1" "Option2" "Quit"; do
  case $opt in
    "Option1") echo "You chose 1";;
    "Option2") echo "You chose 2";;
    "Quit") break;;
  esac
done
```

### `break` / `continue` / `return`
```bash
for i in {1..10}; do
  [[ $i -eq 5 ]] && continue    # 跳过5
  [[ $i -eq 8 ]] && break       # 到8退出循环
  echo $i
done

myfunc() {
  return 0                      # 返回0表示成功
  # 或 return 1 表示失败
}
```

---

## 输入输出与格式化

### `echo` - 输出文本
```bash
echo "hello"                    # 基本输出
echo -n "no newline"            # 不换行
echo -e "tab:\tenter:\n"        # 解析转义符（Bash默认，Zsh需-e）
```

### `printf` - 格式化输出（更可靠）
```bash
printf "Name: %s, Age: %d\n" "Alice" 30
printf "%-10s %5d\n" "Item" 42      # 左对齐+字段宽度
printf "%.2f\n" 3.14159             # 保留2位小数
printf "%b\n" "Color: \033[31mRed\033[0m"  # 解析转义
```

### `read` - 读取用户输入
```bash
read -p "Enter name: " name         # 带提示
read -s -p "Password: " pass        # 静默输入（不显示）
read -t 10 -p "Timeout: " input     # 10秒超时
read -a arr <<< "one two three"     # 读入数组
IFS=: read -r user pass < creds.txt # 自定义分隔符读取
```

### `getopts` - 解析选项参数
```bash
while getopts "vf:o:" opt; do
  case $opt in
    v) verbose=1 ;;
    f) file="$OPTARG" ;;
    o) output="$OPTARG" ;;
    *) echo "Usage: $0 [-v] -f file -o out"; exit 1 ;;
  esac
done
shift $((OPTIND-1))
```

---

## 测试与条件

### `test` / `[` / `[[` - 条件判断
```bash
# [ 是内置命令，[[ 是Zsh/Bash关键字（更强大）
[[ -f file.txt ]] && echo "file exists"
[[ "$var" == "value" ]] || echo "not equal"
[[ $num -gt 10 && $num -lt 100 ]]   # 数值比较+逻辑与

# 常用测试运算符:
# 文件: -e(存在) -f(文件) -d(目录) -r(可读) -x(可执行)
# 字符串: -z(空) -n(非空) == != =~(正则)
# 数值: -eq -ne -gt -lt -ge -le
```

### `:` - 空操作（占位符）
```bash
:                           # 什么都不做，返回true
while :; do sleep 1; done   # 无限循环
: > file.txt                # 清空文件
```

---

## 历史与别名

### `history` - 命令历史
```bash
history                     # 列出历史命令
history 20                  # 最近20条
history -d 123              # 删除第123条（Bash）
history -w                  # 写入历史文件
# Zsh 中历史管理更强大，见 zsh_specific.md
```

### `alias` / `unalias` - 别名管理
```bash
alias ll='ls -lah'          # 创建别名
alias | grep git            # 搜索别名
unalias ll                  # 删除别名
alias -g G='| grep'         # Zsh全局别名: cmd G pattern
```

### `fc` - 历史命令编辑执行（Zsh/Bash）
```bash
fc -e - 123                 # 编辑并执行第123条历史
fc -l -10                   # 列出最近10条
fc -s old=new               # 替换上一条命令的old为new并执行
```

---

## Shell 选项与状态

### `set` / `unset` - Shell 选项控制
```bash
set -e                      # 遇错立即退出（脚本常用）
set -u                      # 未定义变量报错
set -o pipefail             # 管道中任一命令失败则整体失败
set +e                      # 关闭-e选项
set -x                      # 打印执行的命令（调试）
set -o                      # 列出所有选项状态
```

### `shopt` (Bash) / `setopt` (Zsh) - 高级选项
```bash
# Bash
shopt -s nullglob           # 无匹配时通配符展开为空（而非字面*）
shopt -s extglob            # 启用扩展通配: *(pattern)
shopt -p                    # 列出所有选项

# Zsh (见 zsh_specific.md)
setopt autocd               # 目录名直接cd
setopt extended_glob        # 启用**递归通配
```

### `$?` / `$#` / `$@` 等特殊参数
```bash
$?      # 上一条命令的退出状态
$#      # 位置参数个数
$@      # 所有位置参数（保留空格）
$*      # 所有位置参数（合并为单个字符串）
$0      # 脚本/Shell名称
$$      # 当前Shell的PID
$!      # 最近后台作业的PID
$_      # 上一条命令的最后一个参数
```

---

## 实用组合示例

```bash
# 安全执行命令（遇错停止）
set -euo pipefail
command -v jq || { echo "jq required"; exit 1; }

# 函数中局部变量+返回状态
process_file() {
  local file="$1"
  [[ -r "$file" ]] || return 1
  grep -q "pattern" "$file"
}

# 读取配置并导出
while IFS='=' read -r key value; do
  [[ $key =~ ^# ]] && continue
  export "$key=$value"
done < config.env

# 菜单选择+执行
select action in "Backup" "Restore" "Exit"; do
  case $action in
    Backup) tar czf backup.tgz data/ ;;
    Restore) tar xzf backup.tgz ;;
    Exit) break ;;
  esac
done
```

> 💡 **Zsh 技巧**: 用 `whence -v cmd` 查看命令类型（builtin/function/alias/external）
> ```zsh
> whence -v cd        # cd is a shell builtin
> whence -va python   # 显示所有匹配
> ```

> 💡 **调试技巧**: 临时启用详细执行追踪
> ```bash
> set -x; your_command; set +x    # 仅追踪特定命令
> ```
