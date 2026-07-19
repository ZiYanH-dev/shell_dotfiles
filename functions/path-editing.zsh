# 路径编辑相关的键绑定配置

# 修改 wordchars，将 / 从单词字符中移除，这样删除单词时会停在 / 处
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# 或者更精细的控制：自定义 backward-kill-word 函数
backward-kill-path-word() {
  local WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
  zle backward-kill-word
}

zle -N backward-kill-path-word

# 绑定 Ctrl+W 到自定义的删除函数
bindkey '^W' backward-kill-path-word

# 也可以绑定 Option+Backspace（在 macOS 上）
bindkey '^[^?' backward-kill-path-word
