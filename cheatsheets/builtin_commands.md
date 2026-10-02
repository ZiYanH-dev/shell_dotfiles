# Shell 内置命令速查

> 这些命令是 shell 自带的，不需要安装任何外部程序。
> 用 `type <command>` 可以确认某个命令是否内置。

---

## 目录导航

| 命令 | 说明 | 示例 |
|------|------|------|
| `cd` | 切换目录 | `cd ~/Desktop` |
| `cd -` | 回到上一个目录 | — |
| `cd ~` | 回到 home | — |
| `pushd` | 切换目录并压入栈 | `pushd ~/code` |
| `popd` | 弹出栈顶目录并切换 | — |
| `dirs` | 查看目录栈 | `dirs -v` |
| `pwd` | 打印当前目录 | — |

## 变量操作

| 命令         | 说明                 | 示例                                 |
| ---------- | ------------------ | ---------------------------------- |
| `export`   | 导出环境变量（子进程可见）      | `export PATH=$PATH:/usr/local/bin` |
| `typeset`  | 声明变量属性             | `typeset -i num=42`（整数）            |
| `local`    | 声明函数内局部变量          | `local name="test"`                |
| `readonly` | 设为只读               | `readonly PI=3.14`                 |
| `unset`    | 删除变量               | `unset MY_VAR`                     |
| `declare`  | 同 typeset（bash 兼容） | —                                  |
| `printenv` | 打印环境变量             | `printenv PATH`                    |

### typeset 常用选项

```zsh
typeset -i count=0          # 整数类型
typeset -a arr=(a b c)      # 数组
typeset -A hash             # 关联数组（哈希）
typeset -U path             # 去重（常用于 PATH）
typeset -x MY_VAR="value"   # 等同于 export
typeset -r CONST="fixed"    # 等同于 readonly
```

## 输出与输入

| 命令 | 说明 | 示例 |
|------|------|------|
| `echo` | 输出（支持 -n 不换行 -e 转义） | `echo -n "no newline"` |
| `printf` | 格式化输出（推荐） | `printf '%-10s %d\n' "age" 25` |
| `read` | 读取输入 | `read "reply?Continue? (y/n) "` |
| `print` | zsh 专有，比 echo 更安全 | `print -l a b c`（每行一个） |

### print 常用选项

```zsh
print "hello"               # 基本输出（自带换行）
print -n "no newline"       # 不换行
print -l a b c              # 每个参数一行
print -P '%F{red}text%f'   # 支持 prompt 转义（颜色）
print -r '$HOME'            # 原样输出，不转义
```

## 判断与测试

| 命令 | 说明 | 示例 |
|------|------|------|
| `type` | 查看命令类型 | `type ls` → `ls is an alias` |
| `which` | 查找命令路径 | `which python3` |
| `whence` | zsh 专有，更详细 | `whence -v ls` |
| `[[ ]]` | 条件测试（推荐） | `[[ -f file && $x == "y" ]]` |
| `test` / `[ ]` | POSIX 条件测试 | `[ -f file ]` |
| `true` / `false` | 返回 0 / 1 | — |

### [[ ]] 常用条件

```zsh
# 文件判断
[[ -f file ]]     # 是普通文件
[[ -d dir ]]      # 是目录
[[ -e path ]]     # 存在
[[ -r file ]]     # 可读
[[ -w file ]]     # 可写
[[ -x file ]]     # 可执行
[[ -s file ]]     # 非空文件
[[ file1 -nt file2 ]]  # file1 比 file2 新

# 字符串
[[ -z "$str" ]]          # 空字符串
[[ -n "$str" ]]          # 非空
[[ "$a" == "$b" ]]       # 相等
[[ "$a" != "$b" ]]       # 不等
[[ "$a" =~ ^[0-9]+$ ]]   # 正则匹配

# 数值
[[ $n -eq 5 ]]   # 等于
[[ $n -ne 5 ]]   # 不等
[[ $n -lt 5 ]]   # 小于
[[ $n -gt 5 ]]   # 大于
[[ $n -le 5 ]]   # 小于等于
[[ $n -ge 5 ]]   # 大于等于
```

## 源文件与执行

| 命令 | 说明 | 示例 |
|------|------|------|
| `source` / `.` | 在当前 shell 执行脚本 | `source ~/.zshrc` |
| `eval` | 把字符串当命令执行 | `eval "$cmd"` |
| `exec` | 替换当前进程 | `exec zsh`（重载 shell） |
| `command` | 绕过别名/函数，执行外部命令 | `command ls` |
| `builtin` | 强制执行内置命令 | `builtin cd` |
| `nocorrect` | 关闭纠错 | `nocorrect mv file` |
| `noglob` | 关闭通配符展开 | `noglob scp host:file .` |

## 作业控制

| 命令 | 说明 |
|------|------|
| `jobs` | 查看后台作业 |
| `fg` | 把后台作业调到前台 |
| `bg` | 让暂停的作业在后台继续 |
| `Ctrl+Z` | 挂起当前前台进程 |
| `Ctrl+C` | 终止当前前台进程 |
| `disown` | 把作业从 shell 移除（不会随 shell 退出被杀） |

## 历史记录

| 命令 | 说明 | 示例 |
|------|------|------|
| `history` | 查看历史命令 | `history 20`（最近 20 条） |
| `!!` | 上一条命令 | `sudo !!` |
| `!$` | 上一条命令的最后一个参数 | `vim !$` |
| `!n` | 第 n 条历史命令 | `!42` |
| `!prefix` | 最近以 prefix 开头的命令 | `!git` |

## 杂项

| 命令 | 说明 | 示例 |
|------|------|------|
| `alias` | 查看设置别名 | `alias ll='ls -lah'` |
| `unalias` | 删除别名 | `unalias ll` |
| `compdef` | 绑定补全函数 | `compdef _my_fn my_cmd` |
| `bindkey` | 绑定快捷键 | `bindkey '^W' backward-kill-word` |
| `setopt` | 设置 zsh 选项 | `setopt AUTO_CD` |
| `autoload` | 加载函数文件 | `autoload -Uz compinit` |
| `ulimit` | 资源限制 | `ulimit -n 1024`（文件描述符上限） |
| `times` | 查看 shell 累计耗时 | — |
