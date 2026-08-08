# Zsh 参数展开速查 (Parameter Expansion)

> 参数展开是 zsh 最强大也最复杂的特性。
> 掌握这些语法，写 shell 函数时事半功倍。

---

## 基础

```zsh
$name          # 取值
${name}        # 同上，但更安全（边界清晰）
${name:-default}     # 如果 name 为空，用 default
${name:=default}     # 如果 name 为空，赋值 default 并使用
${name:?error}       # 如果 name 为空，报错退出
${name:+value}       # 如果 name 非空，返回 value
```

## 字符串操作

```zsh
${#name}              # 字符串长度
${name#pattern}       # 删除最短前缀匹配
${name##pattern}      # 删除最长前缀匹配
${name%pattern}       # 删除最短后缀匹配
${name%%pattern}      # 删除最长后缀匹配

# 替换
${name/old/new}       # 替换第一个匹配
${name//old/new}      # 替换所有匹配
${name/#old/new}      # 只在开头匹配时替换
${name/%old/new}      # 只在结尾匹配时替换
```

### 实用示例

```zsh
file="archive.tar.gz"

${file#*.}        # → tar.gz       （去最短前缀）
${file##*.}       # → gz           （去最长前缀 = 扩展名）
${file%.*}        # → archive.tar  （去最短后缀 = 去扩展名）
${file%%.*}       # → archive      （去最长后缀）

path="/usr/local/bin"
${path//\//_}     # → usr_local_bin（替换所有 / 为 _）
```

## 大小写转换

```zsh
${name:u}    # 转大写
${name:l}    # 转小写
```

## 间接展开

```zsh
var_name="PATH"
${(P)var_name}     # 取 $PATH 的值（变量名存在变量里）
```

> 你写的 `gete` 函数就用了这个: `local var_value="${(P)var_name}"`

## 展开标志 (Expansion Flags)

放在 `${(flag)name}` 的括号里，可以组合使用。

### 输出格式

| 标志 | 说明 | 示例 |
|------|------|------|
| `(P)` | 间接展开（取变量名对应的值） | `${(P)name}` |
| `(t)` | 返回参数类型字符串 | `${(t)PATH}` → `scalar-export` |
| `(U)` / `(L)` | 转大写 / 转小写 | `${(U)name}` |
| `(W)` | 按空白分词 | — |
| `(f)` | 按换行符分词 | `${(f)$(command)}` |
| `(l)N::str` | 左填充到 N 长度 | `${(l:3::0)5}` → `005` |
| `(r)N::str` | 右填充到 N 长度 | `${(r:10::_ )name}` |

### 排序与去重

| 标志 | 说明 |
|------|------|
| `(o)` | 按字母升序排序 |
| `(O)` | 按字母降序排序 |
| `(ok)` | 按关联数组的键排序 |
| `(ov)` | 按关联数组的值排序 |
| `(u)` | 去重 |

### 示例

```zsh
arr=(c a b a)
print ${(o)arr}       # → a a b c （排序）
print ${(ou)arr}      # → a b c   （排序 + 去重）

# 遍历 parameters 关联数组的键（排序）
for key in ${(ok)parameters}; do
  echo "$key: ${parameters[$key]}"
done
```

### 数组操作

| 标志 | 说明 | 示例 |
|------|------|------|
| `(k)` | 取关联数组的键 | `${(k)hash}` |
| `(v)` | 取关联数组的值 | `${(v)hash}` |
| `(@)` | 保留空元素（配合其他标志） | `"${(@)arr}"` |
| `(s:sep:)` | 按分隔符分割字符串 | `${(s/:/)PATH}` |

### 示例

```zsh
# 把 PATH 按冒号分割成数组
path_array=("${(@s/:/)PATH}")

# 遍历关联数组
typeset -A colors=(red 1 green 2 blue 3)
for key val in "${(@kv)colors}"; do
  echo "$key = $val"
done
```

## 默认值与赋值

```zsh
${name:-fallback}        # name 为空 → 用 fallback（不赋值）
${name:=fallback}        # name 为空 → 赋值 fallback 并使用
${name:"fallback"}       # name 为空 → 用字面量 fallback
${name:?message}         # name 为空 → 打印 message 并退出
```

## 子串提取

```zsh
${name:start}        # 从位置 start 到末尾
${name:start:len}    # 从位置 start 取 len 个字符

str="hello world"
${str:0:5}           # → hello
${str:6}             # → world
```

## 数组切片

```zsh
arr=(a b c d e)
${arr[1]}            # → a （zsh 从 1 开始）
${arr[-1]}           # → e （最后一个）
${arr[2,4]}          # → b c d
${arr[1,3]}          # → a b c
${#arr}              # → 5 （数组长度）
```
