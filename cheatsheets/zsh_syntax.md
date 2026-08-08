# Zsh 语法速查

> 常用语法结构，写函数和脚本时快速参考。

---

## 条件判断

### if / elif / else

```zsh
if [[ -f "$file" ]]; then
  echo "file exists"
elif [[ -d "$file" ]]; then
  echo "it's a directory"
else
  echo "not found"
fi
```

### 算术判断

```zsh
if (( $# == 0 )); then
  echo "no arguments"
fi

if (( $1 > 10 )); then
  echo "bigger than 10"
fi
```

### case

```zsh
case "$1" in
  start)  echo "starting" ;;
  stop)   echo "stopping" ;;
  restart|reload)  echo "restarting" ;;
  *)      echo "usage: $0 {start|stop|restart}" ;;
esac
```

### 简写三元

```zsh
# zsh 不支持 ?: 三元，用这个代替
(( $x > 5 )) && echo "big" || echo "small"
```

## 循环

### for

```zsh
# 遍历列表
for item in a b c; do
  echo "$item"
done

# 遍历数组
arr=(apple banana cherry)
for fruit in $arr; do
  echo "$fruit"
done

# 遍历关联数组
typeset -A config=(host localhost port 8080)
for key in ${(k)config}; do
  echo "$key = ${config[$key]}"
done

# C 风格 for
for (( i=0; i<10; i++ )); do
  echo $i
done
```

### while / until

```zsh
# 读文件逐行
while IFS= read -r line; do
  echo "$line"
done < file.txt

# 计数
count=0
while (( count < 5 )); do
  echo $count
  (( count++ ))
done
```

### repeat (zsh 专有)

```zsh
repeat 3 echo "hello"    # 打印 3 次
```

### select (交互菜单)

```zsh
select opt in "Option A" "Option B" "Quit"; do
  case $opt in
    "Option A") echo "You chose A" ;;
    "Option B") echo "You chose B" ;;
    "Quit")     break ;;
  esac
done
```

## 函数

### 基本定义

```zsh
# 方式一
myfunc() {
  echo "hello"
}

# 方式二
function myfunc {
  echo "hello"
}
```

### 参数处理

```zsh
greet() {
  echo "函数名: $0"
  echo "参数个数: $#"
  echo "第一个参数: $1"
  echo "所有参数: $@"
  echo "所有参数(单字符串): $*"

  # 遍历参数
  for arg in "$@"; do
    echo "  - $arg"
  done
}

greet alice bob charlie
```

### 局部变量

```zsh
counter() {
  local count=0    # local = 函数内可见
  (( count++ ))
  echo $count
}
```

### 返回值

```zsh
# return 返回状态码（0-255）
check() {
  [[ -f "$1" ]] && return 0 || return 1
}

if check "/etc/passwd"; then
  echo "exists"
fi

# 想返回字符串？用 echo + $()
get_date() {
  echo "$(date +%Y-%m-%d)"
}
today=$(get_date)
```

## 数组

```zsh
# 定义
arr=(one two three)
arr[4]="four"          # 追加

# 关联数组（哈希）
typeset -A dict
dict[name]="alice"
dict[age]=25

# 一次性定义
typeset -A dict=(name alice age 25)

# 取值
echo $arr[1]           # → one （zsh 从 1 开始）
echo $dict[name]       # → alice

# 长度
echo ${#arr}           # → 4
echo ${#dict[name]}    # → 5（name 的字符串长度）

# 遍历
for k in ${(k)dict}; do echo "$k: ${dict[$k]}"; done

# 切片
echo ${arr[2,3]}       # → two three

# 追加
arr+=("five" "six")

# 删除元素
unset 'arr[2]'         # 删除索引 2（注意引号）
unset 'dict[name]'     # 删除键 name
```

## 通配符 (Globbing)

```zsh
*.txt              # 所有 .txt 文件
**/*.py            # 递归找所有 .py 文件（zsh 原生支持）
file?.log          # ? 匹配单个字符
[abc].txt          # 匹配 a.txt b.txt c.txt
{a,b,c}.txt        # 展开: a.txt b.txt c.txt

# zsh 限定符（非常强大）
ls *(.)            # 只列普通文件
ls *(/)            # 只列目录
ls *(@)            # 只列符号链接
ls *(m-1)          # 最近 1 天内修改的
ls *(Lk+100)       # 大于 100KB 的文件
ls *.py(.)         # .py 文件且只取普通文件
ls **/*.py(om[1,5])  # 递归找 .py，按修改时间排序，取最近 5 个
```

## 重定向

```zsh
cmd > file          # stdout 写入文件（覆盖）
cmd >> file         # stdout 追加到文件
cmd 2> file         # stderr 写入文件
cmd > file 2>&1     # stdout 和 stderr 都写入文件
cmd &> file         # 同上（zsh 简写）
cmd > /dev/null 2>&1  # 丢弃所有输出

# 管道
cmd1 | cmd2         # cmd1 的 stdout 传给 cmd2
cmd1 |& cmd2        # cmd1 的 stdout+stderr 传给 cmd2（zsh）

# 进程替换
diff <(cmd1) <(cmd2)    # 把命令输出当临时文件
tee >(grep err) >(grep warn) > all.log

# here document
cat << 'EOF'
不会展开变量
$HOME
EOF

cat << EOF
会展开变量
$HOME
EOF
```

## 算术运算

```zsh
(( result = 5 + 3 ))
(( result = 5 * 3 ))
(( result = 10 / 3 ))     # → 3（整数除法）
(( result = 10 % 3 ))     # → 1（取余）
(( result = 2 ** 10 ))    # → 1024（幂）

# 自增自减
(( i++ ))
(( i-- ))

# 比较返回 0 (true) 或 1 (false)
(( 5 > 3 )) && echo "yes"

# 浮点运算需要用 bc 或 awk
echo "scale=2; 10/3" | bc    # → 3.33
```

## setopt 常用选项

```zsh
setopt AUTO_CD          # 输入目录名直接 cd
setopt AUTO_PUSHD       # cd 时自动压栈
setopt PUSHD_IGNORE_DUPS  # 目录栈去重
setopt EXTENDED_GLOB    # 启用扩展通配符
setopt INTERACTIVE_COMMENTS  # 交互式 shell 允许注释
setopt NO_BEEP          # 关闭蜂鸣
setopt CORRECT          # 命令拼写纠错
setopt HIST_IGNORE_DUPS  # 历史记录忽略连续重复
setopt SHARE_HISTORY    # 多终端共享历史
```

## 特殊变量

| 变量 | 含义 |
|------|------|
| `$?` | 上一条命令的退出码（0 = 成功） |
| `$!` | 最近一个后台进程的 PID |
| `$$` | 当前 shell 的 PID |
| `$0` | 脚本/函数名 |
| `$#` | 参数个数 |
| `$@` | 所有参数（各自独立） |
| `$*` | 所有参数（合为一个字符串） |
| `$-` | 当前 shell 选项标志 |
| `$_` | 上一条命令的最后一个参数 |
| `$IFS` | 内部字段分隔符（默认空格+tab+换行） |
| `$RANDOM` | 随机数 (0-32767) |
| `$LINENO` | 当前行号 |
| `$ZSH_VERSION` | zsh 版本号 |
