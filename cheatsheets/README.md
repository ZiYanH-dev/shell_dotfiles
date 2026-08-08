# Zsh Cheatsheets

终端速查手册，写函数时翻一翻。

## 文件说明

| 文件 | 内容 |
|------|------|
| `builtin_commands.md` | Shell 内置命令（cd, export, typeset, read, source 等） |
| `parameter_expansion.md` | 参数展开语法（${...} 各种用法、展开标志） |
| `zsh_syntax.md` | 语法结构（条件、循环、函数、数组、通配符、重定向、特殊变量） |
| `zsh_completion.md` | Tab 补全系统（compdef, _describe, _arguments, zstyle） |

## 快速查找

```
# 查某个展开 flag 是什么意思
	grep -n '(P)' parameter_expansion.md

# 查某个内置命令
grep -n 'typeset' builtin_commands.md

# 查某个语法结构
grep -n 'for' zsh_syntax.md
```
