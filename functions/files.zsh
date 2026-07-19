
# 自动为所有 ~/.* 目录创建别名 .xxx="cd ~/.xxx"
generate_dot_folder_aliases() {
  # 遍历 home 下所有以 . 开头的目录
  for dir in "$HOME"/.*; do
    # 只处理目录，排除 . 和 ..
    if [[ -d "$dir" && "$dir" != "$HOME/." && "$dir" != "$HOME/.." ]]; then
      # 提取文件夹名 .hermes
      folder_name="${dir#$HOME/}"
      # 创建 alias: alias .hermes='cd ~/.hermes'
      alias "$folder_name"="cd $dir"
    fi
  done
}

# 执行生成别名
# generate_dot_folder_aliases() wrong
generate_dot_folder_aliases