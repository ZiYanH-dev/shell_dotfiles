# Zsh 特有命令与特性大全

Zsh 相比 Bash 的独特功能和增强特性。

## 配置与初始化

### `.zshrc` / `.zprofile` - 配置文件
```bash
# ~/.zshrc 常用配置示例
export PATH="$HOME/bin:$PATH"
alias ll='ls -lah'
setopt autocd                 # 目录名直接cd
setopt extended_glob          # 启用**递归通配
setopt hist_ignore_space      # 空格开头的命令不记录历史
```

### `source` / `.` - 重新加载配置
```bash
source ~/.zshrc               # 应用配置更改
. ~/.zshrc                    # 同上，简写
```

## 高级补全

### `compinit` - 启用智能补全
```zsh
autoload -Uz compinit && compinit
# 启用后: git checkout <Tab> 显示分支, ssh <Tab> 显示known_hosts
```

### `compdef` - 自定义补全规则
```zsh
compdef _git gc=checkout      # 为git gc命令添加checkout的补全
```

## 历史增强

### 历史搜索与导航
```zsh
# .zshrc 中启用
setopt share_history          # 多终端共享历史
setopt hist_find_no_dups      # 搜索时去重
setopt hist_verify            # 历史命令先编辑再执行

# 快捷键:
Ctrl+R                        # 反向搜索历史
Ctrl+S                        # 正向搜索历史
!!                            # 上一条命令
!git                          # 最近以git开头的命令
^old^new                      # 替换上一条命令的old为new
```

### `fc` - 历史命令编辑
```zsh
fc -e vim 123                 # 用vim编辑第123条历史命令
fc -l -20                     # 列出最近20条历史
```

## 高级通配与扩展

### 递归通配 `**`
```zsh
setopt extended_glob
ls **/*.md                    # 递归查找所有.md文件
rm **/*.log~                  # 删除所有备份日志文件
```

### 范围与排除
```zsh
ls *.(txt|md)                 # 匹配.txt或.md
ls ^*.bak                     # 排除.bak文件
ls *(^/.)                     # 仅普通文件（排除目录）
```

### 修饰符
```zsh
echo /path/to/file(:t)        # 仅文件名: file
echo /path/to/file(:h)        # 仅目录: /path/to
echo /path/to/file(:r)        # 去扩展名: /path/to/file
echo /path/to/file(:e)        # 仅扩展名: txt
```

## 参数与变量扩展

### 默认值与替换
```zsh
echo ${VAR:-default}          # VAR未设或空时用default
echo ${VAR:=default}          # 同上并赋值给VAR
echo ${VAR:+alternate}        # VAR有值时用alternate
echo ${VAR:?error}            # VAR未设时显示error并退出
```

### 字符串操作
```zsh
name="hello world"
echo ${name:0:5}              # 截取: hello
echo ${name// /_}             # 替换所有空格: hello_world
echo ${name:u}                # 大写: HELLO WORLD
echo ${name:l}                # 小写: hello world
```

### 数组操作
```zsh
arr=(one two three)
echo $arr[1]                  # 第一个元素: one（Zsh索引从1开始）
echo $arr[-1]                 # 最后一个元素: three
echo ${arr[@]:2:2}            # 从索引2开始取2个: two three
```

## 提示符定制

### `PROMPT` / `RPROMPT` - 左右提示符
```zsh
# ~/.zshrc
PROMPT='%n@%m:%~%# '          # 用户@主机:路径#
RPROMPT='[%D{%H:%M}]'         # 右侧显示时间
# 颜色: %F{red}红色 %f重置, %B加粗 %b正常
PROMPT='%F{green}%n@%m%f:%~%# '
```

### `precmd` / `preexec` - 钩子函数
```zsh
precmd() { echo -n "\033]0;$(pwd)\007" }  # 更新终端标题
preexec() { echo "Running: $1" }          # 命令执行前打印
```

## 插件与主题（Oh My Zsh）

### 常用插件
```zsh
# ~/.zshrc plugins=(...)
plugins=(
  git           # git别名和补全
  z             # 智能目录跳转
  syntax-highlighting  # 命令高亮
  autosuggestions      # 历史命令建议
  copypath      # 复制路径到剪贴板
)
```

### 主题示例
```zsh
ZSH_THEME="agnoster"        # 流行主题，需Powerline字体
ZSH_THEME="powerlevel10k/powerlevel10k"  # 高性能主题
# 或自定义: prompt_mytheme_setup() { ... }
```

## 实用别名与函数

### 推荐别名
```zsh
# ~/.zshrc
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
```

### 实用函数
```zsh
# 快速创建并进入目录
mkcd() { mkdir -p "$1" && cd "$1" }

# 提取任意压缩包
extract() {
  case $1 in
    *.tar.gz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *) echo "Unsupported format" ;;
  esac
}

# 搜索并编辑
se() { vim $(rg --files | fzf) }
```

## Zsh 调试

### `setopt` / `unsetopt` - 选项控制
```zsh
setopt xtrace               # 打印每条执行的命令（调试）
unsetopt xtrace             # 关闭调试
setopt verbose              # 打印读取的命令
```

### `typeset` / `declare` - 变量属性
```zsh
typeset -U PATH             # PATH去重
typeset -rx MYVAR=value     # 只读+导出
typeset -i num=42           # 声明为整数
```

> 💡 **Zsh 技巧**: 使用 `run-help` 获取命令帮助
> ```zsh
> autoload -Uz run-help && run-help git    # 查看git帮助
> alias help=run-help
> ```

> 💡 **性能优化**: 重建补全缓存
> ```zsh
> rm -rf ~/.zcompdump; compinit             # 补全变慢时执行
> ```
