# Zsh Configuration Files Structure

简洁的 zsh 配置结构，按功能分类组织。

## 目录结构

```
zsh/
├── Aliases/              # 别名配置
├── api_keys/             # API Key 管理
├── cmd_help/             # 命令帮助文档
├── functions/            # 自定义函数
├── llm_docs/             # LLM 相关文档
├── loader.zsh            # 统一加载器
├── README.md             # 说明文档
└── .gitignore            # Git 忽略规则
```

> **规则**: `zsh/` 目录下只保留 `loader.zsh`、`README.md` 和 `.gitignore` 这三个文件。如需添加新文件，请放入对应的子文件夹中。

## 使用方法

在你的 `~/.zshrc` 文件中添加一行：

```bash
source /path/to/zsh/loader.zsh
```

loader 会自动加载所有子文件夹中的 `.zsh` 文件。

## 加载顺序

loader.zsh 按字母顺序遍历子文件夹，依次加载其中的 `.zsh` 文件。

## 自定义添加

要添加新的配置，只需在相应的子文件夹中创建新的 `.zsh` 文件：

- **别名**: 在 `Aliases/` 中创建
- **函数**: 在 `functions/` 中创建
- **API Key**: 在 `api_keys/` 中创建
- **其他**: 新建子文件夹分类管理

所有 `.zsh` 文件都会被自动加载，无需修改 loader。

## 注意事项

- 子文件夹名称以 `.` 开头的会被跳过（如 `.vscode`）
- 每个子文件夹下的 `.zsh` 文件按字母顺序加载
- 建议按功能分类创建文件，便于维护