# 网络命令大全

网络连接、下载、调试相关命令，适用于 zsh/bash shell。

## HTTP/HTTPS 请求

### `curl` - 传输数据（最常用）
```bash
curl https://example.com                    # 基本GET请求
curl -I https://example.com                 # 仅获取响应头
curl -O https://example.com/file.zip        # 下载文件（保留原名）
curl -o custom.zip https://.../file.zip     # 下载并重命名
curl -X POST -d "key=value" https://api...  # POST请求
curl -H "Authorization: Bearer TOKEN" ...   # 添加请求头
curl -u user:pass https://...               # 基本认证
curl -s https://... | jq .                  # 静默模式+JSON格式化
curl -w "%{http_code}" -o /dev/null -s ...  # 仅获取状态码
```

### `wget` - 文件下载工具
```bash
wget https://example.com/file.zip           # 下载文件
wget -c https://...                         # 断点续传
wget -r -l 2 https://...                    # 递归下载（深度2）
wget -q -O - https://... | bash             # 下载并执行脚本
```

### `httpie` / `http` - 人性化HTTP客户端（需安装）
```bash
http GET https://api.example.com/users      # GET请求
http POST :8000 name=John age:=30           # POST到本地
http -h GET https://...                     # 仅显示请求头
```

## 网络诊断

### `ping` - 测试网络连通性
```bash
ping example.com                            # 持续ping（Ctrl+C停止）
ping -c 4 example.com                       # 发送4个包后停止
ping -i 0.5 example.com                     # 0.5秒间隔
```

### `traceroute` / `tracepath` - 路由追踪
```bash
traceroute example.com                      # macOS/Linux路由追踪
tracepath example.com                       # Linux替代方案（无需root）
```

### `nslookup` / `dig` - DNS查询
```bash
nslookup example.com                        # 查询DNS记录
dig example.com                             # 更详细的DNS信息
dig +short example.com                      # 简洁输出
```

### `netstat` / `ss` - 网络连接状态
```bash
netstat -tuln                               # 查看监听端口
ss -tuln                                    # 现代替代（更快）
netstat -rn                                 # 查看路由表
```

### `lsof` - 查看打开的文件/端口
```bash
lsof -i :8080                               # 查看8080端口占用
lsof -iTCP -sTCP:LISTEN                     # 查看TCP监听端口
lsof -u username                            # 查看用户打开的文件
```

## SSH/SCP/SFTP

### `ssh` - 远程登录
```bash
ssh user@host                               # 基本连接
ssh -p 2222 user@host                       # 指定端口
ssh -i ~/.key user@host                     # 指定密钥
ssh -L 8080:localhost:80 user@host          # 本地端口转发
ssh -R 9000:localhost:3000 user@host        # 远程端口转发
```

### `scp` - 安全复制
```bash
scp file.txt user@host:/path/               # 上传文件
scp user@host:/path/file.txt ./             # 下载文件
scp -r dir/ user@host:/path/                # 递归复制目录
```

### `sftp` - 安全文件传输交互
```bash
sftp user@host                              # 进入交互模式
# 交互命令: put, get, ls, cd, mkdir, rm 等
```

## 网络工具

### `nc` / `netcat` - 网络瑞士军刀
```bash
nc -zv host 22                              # 测试端口连通性
nc -l 8080                                  # 监听8080端口
echo "test" | nc host 1234                  # 发送数据到端口
```

### `telnet` - 简单TCP测试（已逐步淘汰）
```bash
telnet host 23                              # 连接Telnet服务
telnet host 80                              # 测试HTTP端口
```

### `nmap` - 网络扫描（需安装）
```bash
nmap example.com                            # 基础端口扫描
nmap -sV example.com                        # 检测服务版本
nmap -p 80,443 example.com                  # 扫描指定端口
```

## 实用组合示例

```bash
# 检查网站响应时间
curl -o /dev/null -s -w "Time: %{time_total}s\n" https://example.com

# 批量测试端口
for port in 22 80 443; do nc -zv -w1 host $port; done

# 下载并解压
curl -sL https://.../app.tar.gz | tar xz -C /tmp/

# 监控API状态
while true; do curl -s -o /dev/null -w "%{http_code}\n" https://api...; sleep 60; done
```

> 💡 **Zsh 技巧**: 使用 `curl` 的 `--progress-bar` 获得更友好的下载进度
> ```bash
> curl --progress-bar -O https://example.com/large.zip
> ```
