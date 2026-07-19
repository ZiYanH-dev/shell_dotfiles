# 文件操作命令大全

常用的文件和目录操作命令，适用于 zsh/bash shell。

## 目录浏览

### `ls` - 列出目录内容
```bash
ls                    # 基本列出
ls -l                 # 详细列表（权限、大小、时间）
ls -la                # 包含隐藏文件
ls -lh                # 人类可读的文件大小
ls -t                 # 按修改时间排序
ls -S                 # 按文件大小排序
ls *.txt              # 通配符过滤
```

### `pwd` - 显示当前工作目录
```bash
pwd                   # 输出绝对路径
```

## 目录导航

### `cd` - 切换目录
```bash
cd /path/to/dir       # 切换到指定目录
cd ..                 # 返回上一级
cd ~                  # 回到 home 目录
cd -                  # 回到上一个目录
```

## 文件/目录创建与删除

### `mkdir` - 创建目录
```bash
mkdir newdir          # 创建单个目录
mkdir -p a/b/c        # 递归创建多级目录
```

### `rm` - 删除文件/目录 ⚠️
```bash
rm file.txt           # 删除文件
rm -r dir/            # 递归删除目录
rm -rf dir/           # 强制递归删除（谨慎使用！）
rm -i *.log           # 删除前逐个确认
```

### `cp` - 复制
```bash
cp src.txt dst.txt    # 复制文件
cp -r src/ dst/       # 递归复制目录
cp -i *.txt backup/   # 覆盖前确认
```

### `mv` - 移动/重命名
```bash
mv old.txt new.txt    # 重命名文件
mv file.txt /tmp/     # 移动文件到指定目录
```

## 文件查看与编辑

### `cat` - 查看文件内容
```bash
cat file.txt          # 输出全部内容
cat -n file.txt       # 显示行号
cat file1 file2       # 合并显示多个文件
```

### `less` / `more` - 分页查看
```bash
less large.log        # 分页浏览，支持搜索 /pattern
more file.txt         # 简单分页查看
```

### `head` / `tail` - 查看首尾
```bash
head -20 file.txt     # 查看前20行
tail -f log.txt       # 实时追踪文件末尾（日志监控）
```

## 权限与属性

### `chmod` - 修改权限
```bash
chmod +x script.sh    # 添加执行权限
chmod 755 dir/        # rwxr-xr-x
chmod -R 644 *.txt    # 递归修改
```

### `chown` - 修改所有者
```bash
chown user:group file # 修改用户和组
chown -R user dir/    # 递归修改
```

### `stat` - 查看文件详细信息
```bash
stat file.txt         # 显示inode、权限、时间等
```

## 查找与定位

### `find` - 查找文件
```bash
find . -name "*.md"               # 按名称查找
find . -type f -mtime -7          # 7天内修改的文件
find . -size +100M                # 大于100M的文件
```

### `which` / `where` - 查找命令位置
```bash
which ls                          # 显示命令路径
where python                      # zsh: 显示所有匹配路径
```

> 💡 **Zsh 技巧**: 使用 `**` 递归通配符（需启用 `setopt extended_glob`）
> ```bash
> ls **/*.md    # 递归查找所有 .md 文件
> ```
