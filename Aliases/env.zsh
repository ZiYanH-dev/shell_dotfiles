# 1. Zsh autocomplete (Tab auto-fix lowercase/uppercase)
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 2. System language (keep this for basic setup)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export hzy=nb

# 5. Load local secrets (not committed to git)
if [[ -f "$HOME/Desktop/code_project/shell_script/zsh/Aliases/env.local.zsh" ]]; then
    source "$HOME/Desktop/code_project/shell_script/zsh/Aliases/env.local.zsh"
fi