# 1. Zsh autocomplete (Tab auto-fix lowercase/uppercase)
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 2. System language (keep this for basic setup)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export email_auth="NTvRz39Ve7uCFHEb"
hzy=nb