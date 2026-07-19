# 文本处理命令大全

强大的文本搜索、过滤、转换工具，shell 数据处理的核心。

## 基础查看与统计

### `cat` - 连接并显示文件
```bash
cat file.txt                    # 显示内容
cat -n file.txt                 # 显示行号
cat -s file.txt                 # 压缩空行
```

### `wc` - 统计行数、字数、字节数
```bash
wc file.txt                     # 显示 行数 单词数 字节数
wc -l file.txt                  # 仅统计行数
wc -w file.txt                  # 仅统计单词数
wc -c file.txt                  # 仅统计字节数
```

## 搜索与过滤

### `grep` - 文本搜索（最常用！）
```bash
grep "pattern" file.txt                    # 基本搜索
grep -i "pattern" file.txt                 # 忽略大小写
grep -r "pattern" ./src/                   # 递归搜索目录
grep -n "pattern" file.txt                 # 显示匹配行号
grep -v "pattern" file.txt                 # 反向匹配（排除）
grep -E "pat1|pat2" file.txt               # 扩展正则（OR）
grep -A 3 "pattern" file.txt               # 显示匹配后3行
grep -B 2 "pattern" file.txt               # 显示匹配前2行
grep -C 2 "pattern" file.txt               # 显示匹配前后各2行
grep -l "pattern" *.log                    # 仅显示含匹配的文件名
```

### `egrep` / `grep -E` - 扩展正则表达式
```bash
egrep "error|fail|warn" log.txt           # 多模式匹配
grep -E "^[0-9]{3}-" file.txt             # 正则匹配电话号码
```

### `fgrep` / `grep -F` - 固定字符串搜索（更快）
```bash
fgrep "*.tmp" file.txt                    # 搜索字面字符串，非正则
```

## 流编辑与转换

### `sed` - 流编辑器（替换/删除/插入）
```bash
sed 's/old/new/g' file.txt                # 全局替换
sed -n '5,10p' file.txt                   # 打印第5-10行
sed '/pattern/d' file.txt                 # 删除匹配行
sed '1s/^/# /' file.txt                   # 首行添加#注释
sed -i 's/foo/bar/g' file.txt             # 原地修改文件（macOS用 -i ''）
```

### `awk` - 文本分析与报告生成（强大！）
```bash
awk '{print $1}' file.txt                 # 打印第一列
awk -F: '{print $1}' /etc/passwd          # 指定分隔符
awk '/error/ {print $0}' log.txt          # 条件打印
awk '{sum+=$2} END {print sum}' data.txt  # 求和计算
awk 'NR<=10' file.txt                     # 打印前10行
awk 'NF>3' file.txt                       # 打印字段数>3的行
```

### `cut` - 截取字段
```bash
cut -d: -f1 /etc/passwd                   # 按:分隔，取第1列
cut -c1-10 file.txt                       # 截取字符1-10
cut -f2-4 data.tsv                        # TSV文件取2-4列
```

### `sort` - 排序
```bash
sort file.txt                             # 字母排序
sort -n numbers.txt                       # 数值排序
sort -r file.txt                          # 逆序
sort -u file.txt                          # 去重后排序
sort -t: -k3 -n /etc/passwd              # 按第3字段数值排序
```

### `uniq` - 去重（需先排序）
```bash
sort file.txt | uniq                    # 去重
sort file.txt | uniq -c                 # 统计每行出现次数
sort file.txt | uniq -d                 # 仅显示重复行
```

## 替换与转换

### `tr` - 字符转换/删除
```bash
echo "HELLO" | tr 'A-Z' 'a-z'           # 大写转小写
cat file.txt | tr -d '\r'               # 删除回车符（Windows→Unix）
tr -s ' ' < file.txt                    # 压缩连续空格
```

### `xargs` - 构建并执行命令
```bash
find . -name "*.log" | xargs rm         # 批量删除日志
cat files.txt | xargs -n1 cp -t backup/ # 逐个复制
ps aux | grep python | grep -v grep | awk '{print $2}' | xargs kill
```

## 比较与合并

### `diff` - 文件对比
```bash
diff file1.txt file2.txt                # 显示差异
diff -u file1.txt file2.txt             # 统一格式输出（patch用）
diff -r dir1/ dir2/                     # 递归比较目录
```

### `comm` - 比较两个已排序文件
```bash
comm -12 file1.txt file2.txt            # 仅显示共同行
comm -23 file1.txt file2.txt            # 仅file1独有的行
```

### `paste` - 合并文件行
```bash
paste file1.txt file2.txt               # 并排合并（tab分隔）
paste -d, file1.txt file2.txt           # 用逗号分隔
```

## 实用组合示例

```bash
# 统计日志中各IP访问次数
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -10

# 提取JSON中的特定字段（简单场景）
cat data.json | grep -o '"name":"[^"]*"' | cut -d'"' -f4

# 批量重命名文件
ls *.txt | sed 's/old/new/' | xargs -n2 mv

# 查找并统计包含error的行
grep -r "error" ./logs/ | wc -l
```

> 💡 **Zsh 技巧**: 使用进程替换简化管道
> ```bash
> diff <(sort file1) <(sort file2)    # 无需临时文件
> ```
