# 包管理命令大全

macOS/Linux 常用包管理器命令速查。

## Homebrew (macOS/Linux)

### 基础操作
```bash
brew install package                        # 安装包
brew uninstall package                      # 卸载包
brew upgrade                                # 升级所有包
brew upgrade package                        # 升级指定包
brew list                                     # 列出已安装包
brew info package                           # 查看包信息
brew search keyword                         # 搜索包
brew cleanup                                # 清理旧版本
```

### Cask (图形应用)
```bash
brew install --cask app-name                # 安装GUI应用
brew list --cask                            # 列出已装cask
brew upgrade --cask                         # 升级cask应用
```

### 维护命令
```bash
brew doctor                                 # 检查系统问题
brew update                                 # 更新brew本身
brew deps package                           # 查看依赖
brew uses package                           # 查看哪些包依赖它
brew services list                          # 查看brew管理的服务
brew services restart package               # 重启服务
```

## npm (Node.js)

### 包管理
```bash
npm install package                         # 安装包（到node_modules）
npm install -g package                      # 全局安装
npm install package@1.2.3                   # 安装指定版本
npm uninstall package                       # 卸载包
npm update                                  # 更新包
npm list -g --depth=0                       # 列出全局包
npm outdated                                # 查看可更新的包
```

### 项目管理
```bash
npm init -y                                 # 快速初始化package.json
npm install                                 # 安装package.json依赖
npm install --save-dev package              # 安装为dev依赖
npm run script-name                         # 运行scripts中的命令
npm audit                                   # 安全审计
npm audit fix                               # 自动修复安全问题
```

### 实用命令
```bash
npm exec package -- args                    # 临时执行包命令（npx）
npx create-react-app my-app                 # 创建React应用
npm link                                    # 本地开发链接
npm view package version                    # 查看远程包版本
```

## pip (Python)

### 包管理
```bash
pip install package                         # 安装包
pip install -r requirements.txt             # 安装依赖文件
pip install -e ./package                    # 可编辑模式安装
pip uninstall package                       # 卸载包
pip list                                    # 列出已安装包
pip show package                            # 查看包详情
pip search keyword                          # 搜索包（PyPI）
```

### 环境管理
```bash
pip freeze > requirements.txt               # 导出依赖
pip install --upgrade pip                   # 升级pip自身
pip install --user package                  # 安装到用户目录
pip check                                   # 检查依赖冲突
```

### virtualenv/venv
```bash
python -m venv myenv                        # 创建虚拟环境
source myenv/bin/activate                   # 激活环境（macOS/Linux）
myenv\Scripts\activate                      # 激活环境（Windows）
deactivate                                  # 退出环境
```

## Cargo (Rust)

### 项目管理
```bash
cargo new project-name                      # 创建新项目
cargo build                                 # 编译项目
cargo build --release                       # 发布模式编译
cargo run                                   # 编译并运行
cargo test                                  # 运行测试
cargo check                                 # 快速检查（不生成二进制）
```

### 依赖管理
```bash
cargo add package                           # 添加依赖（Rust 1.62+）
cargo add package --dev                     # 添加dev依赖
cargo update                                # 更新Cargo.lock
cargo tree                                  # 显示依赖树
```

### 发布与工具
```bash
cargo install package                       # 安装二进制工具
cargo install --path .                      # 安装当前项目
cargo clippy                                # 代码lint检查
cargo fmt                                   # 格式化代码
cargo doc --open                            # 生成并打开文档
```

## 其他包管理器

### apt (Debian/Ubuntu)
```bash
sudo apt update                             # 更新包索引
sudo apt install package                    # 安装包
sudo apt remove package                     # 卸载（保留配置）
sudo apt purge package                      # 彻底卸载
sudo apt upgrade                            # 升级已安装包
apt search keyword                          # 搜索包
apt show package                            # 查看包信息
```

### dnf/yum (Fedora/RHEL)
```bash
sudo dnf install package                    # 安装包
sudo dnf remove package                     # 卸载包
sudo dnf update                             # 升级系统
dnf search keyword                          # 搜索包
dnf info package                            # 查看包信息
```

### yay/paru (AUR - Arch User Repository)
```bash
yay -S package                              # 安装AUR包
yay -Syu                                    # 更新系统+AUR
yay -Rs package                             # 递归卸载
yay -Ss keyword                             # 搜索AUR
```

## 实用组合示例

```bash
# 批量导出已安装包
brew list > brew-packages.txt
pip freeze > pip-requirements.txt

# 检查过时包并升级
brew outdated | xargs -n1 brew upgrade

# 清理所有包管理器缓存
brew cleanup && npm cache clean --force && pip cache purge

# 一键安装开发环境（macOS）
brew install node python3 rust git
npm install -g yarn pnpm
pip install --user black flake8
```

> 💡 **Zsh 技巧**: 为包管理器添加智能补全
> ```zsh
> # ~/.zshrc - Homebrew补全
> if command -v brew &>/dev/null; then
>   eval "$(brew shellenv)"
> fi
> ```

> 💡 **跨平台安装脚本示例**:
> ```bash
> # install-tools.sh
> case "$(uname -s)" in
>   Darwin)
>     brew install "$@"
>     ;;
>   Linux)
>     if command -v apt &>/dev/null; then
>       sudo apt install -y "$@"
>     fi
>     ;;
> esac
> ```
