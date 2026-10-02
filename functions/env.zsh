# 查看变量的值（支持 Tab 补全所有 shell 变量名，无需 export）
# 用法: getenv <TAB>  →  提示所有变量（包括未 export 的）
#       getenv PATH   →  输出 $PATH 的值并自动拷贝到剪贴板

gete() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: getenv <VARIABLE_NAME>"
    echo "Tip: 按 Tab 键补全所有环境变量名"
    return 1
  fi

  local var_name="$1"
  local var_value="${(P)var_name}"  # 间接展开，取变量值

  if [[ -z "$var_value" ]]; then
    echo "getenv: 变量 '$var_name' 未设置或为空"
    return 1
  fi

  # printf '%s\n' "$var_value"
  echo 'copy successful'

  # 自动拷贝到剪贴板（macOS: pbcopy, Linux: xclip/xsel）
  if (( $+commands[pbcopy] )); then
    printf '%s' "$var_value" | pbcopy
  elif (( $+commands[xclip] )); then
    printf '%s' "$var_value" | xclip -selection clipboard
  elif (( $+commands[xsel] )); then
    printf '%s' "$var_value" | xsel --clipboard --input
  fi
}

# getenv 的 Tab 补全：列出所有 shell 变量名（不区分是否 export）
_getenv_completions() {
  local -a env_vars
  local key
  for key in ${(ok)parameters}; do
    # 跳过特殊参数名（., *, #, @, ?, 1 等），只保留合法标识符
    [[ "$key" =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] || continue
    # parameters[$key] 的值本身就是类型描述，如 "scalar"、"scalar-export"
    [[ "${parameters[$key]}" == scalar* ]] && env_vars+=("$key")
  done
  _describe 'shell variable' env_vars
}

compdef _getenv_completions gete
