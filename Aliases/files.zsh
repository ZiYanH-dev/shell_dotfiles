# Folder shortcuts (nicknames)
alias downloads='cd ~/Downloads'
alias dl='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias dt='cd ~/Desktop'
alias docs='cd ~/Documents'
alias trial='cd ~/Desktop/trial'
alias tri=trial
alias whatever='cd ~/Desktop/whatever'
alias shit=whatever
alias clone='cd ~/Desktop/whatever/clone-project'
alias src='cd /Users/jasonhuang/Desktop/learning-resources'
alias leetcode='cd /Users/jasonhuang/Desktop/random_code/coding_pra'

alias .brew='cd /opt/homebrew'

alias obs='cd ~/Documents/Obsidian_Vault'
alias lec='cd ~/Desktop/lecture_notes'
alias aipro='cd ~/Desktop/trial/ai_trial/projects'
alias imp='cd ~/Desktop/important'
alias pa='cd /Users/jasonhuang/Desktop/programming_assignment'


alias logisim='java -jar /Applications/Logisim.app/Contents/Resources/Java/logisim.jar'

alias wh=which
alias fl='file'


# Better ls
alias ll='ls -lhaS'
alias la='ls -AF'
alias l='ls -CF'
alias l.='ls -d .*'
alias lt='ls -lht'

# Quick clear
alias cls='clear'

# Short cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
alias /='cd /'


# Recursively delete (safer than raw rm -rf)
alias rmd='rm -rf'

# Quick file operations
alias md='mkdir -p'
alias rd='rmdir'
alias t='touch'
alias cpr='cp -r'

# Find files quickly
alias f='find . -name'
alias ff='find . -type f -name'
alias fd='find . -type d -name'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# History search
alias h='history'
alias hs='history | grep'

# Disk usage
alias dush='du -sh * | sort -rh'

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias finder='open -a Finder'
alias ql='qlmanage -p'

# Copy current path to clipboard
alias copypath='pwd | pbcopy'
alias cpath=copypath
alias copyfile='cat $1 | pbcopy'

# Copy text of last command (safe, no error)
alias ccmd='fc -ln -1 | pbcopy'
# Re-run last command, print output to screen + copy output
alias cout='eval "$(fc -ln -1)" | tee >(pbcopy)'

# Quick edit
alias zshrc='s ~/.zshrc'
alias reload='source ~/.zshrc'
