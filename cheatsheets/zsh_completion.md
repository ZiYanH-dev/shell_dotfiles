# Zsh 补全系统速查

> Tab 补全是 zsh 最强的特性之一。这里记录核心用法。

---

## 补全系统基础

### 初始化（通常在 .zshrc 里）

```zsh
autoload -Uz compinit
compinit
```

### 补全函数命名规则

```
_cmdname          # 补全函数名 = 下划线 + 命令名
```

例如命令 `gete` 的补全函数叫 `_gete`。

### 绑定补全函数

```zsh
compdef _my_completion my_command
```

## 补全函数核心 API

### _describe — 静态列表

最简单的方式，适合固定的候选列表。

```zsh
_my_completion() {
  local -a items
  items=(
    "start:启动服务"
    "stop:停止服务"
    "restart:重启服务"
  )
  _describe 'command' items
}
```

格式: `"value:description"`，Tab 补全时会显示 description。

### _arguments — 命令行参数补全

适合有 flags 和 positional 参数的命令。

```zsh
_my_fn() {
  _arguments \
    '(-h --help)'{-h,--help}'[show help]' \
    '--port=[port number]:port:' \
    '--mode=[run mode]:mode:(dev prod test)' \
    '*:files:_files'
}
```

### _files / _directories — 文件/目录补全

```zsh
_my_fn() {
  _arguments '*:file:_files'
}
```

### _values — 枚举值

```zsh
_my_fn() {
  _values 'mode' dev prod test
}
```

### _alternative — 多种补全来源

```zsh
_my_fn() {
  _alternative \
    'files:file:_files' \
    'dirs:directory:_directories' \
    'users:user:_users'
}
```

## 实战模式

### 动态生成补全列表

```zsh
_my_fn() {
  local -a vars
  # 从命令输出动态生成
  vars=("${(@f)$(some_command)}")
  _describe 'option' vars
}
```

### 从关联数组生成补全（你写的 gete 用的方式）

```zsh
_my_fn() {
  local -a items
  local key
  for key in ${(ok)parameters}; do
    [[ "$key" =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] || continue
    [[ "${parameters[$key]}" == scalar* ]] && items+=("$key")
  done
  _describe 'shell variable' items
}
compdef _my_fn my_command
```

## 补全缓存

```zsh
# 强制重建补全缓存
rm -f ~/.zcompdump*
autoload -Uz compinit
compinit
```

## 补全样式 (zstyle)

```zsh
# 菜单选择：按 Tab 在候选间循环
zstyle ':completion:*' menu select

# 补全列表带分组标签
zstyle ':completion:*' group-name ''

# 补全描述带颜色
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# 大小写不敏感补全
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 补全时对命令排序
zstyle ':completion:*' sort true
```
