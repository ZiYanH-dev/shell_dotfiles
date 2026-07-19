# Git快速推送当前分支
gpublish() {
  local branch=$(git branch --show-current)
  git push -u origin $branch
}

# Git快速删除已合并的分支
gcleanbranches() {
  git branch --merged | grep -v "\*" | grep -v "main\|master\|develop" | xargs -n 1 git branch -d
}

# Git快速切换到上一个分支
gback() {
  git checkout -
}

# Git快速查看文件历史
gfilelog() {
  git log --follow --oneline -- "$1"
}

# Git快速查看远程仓库地址
gremote() {
  git remote -v
}

# Git快速查看当前分支信息
ginfo() {
  echo "Current branch: $(git branch --show-current)"
  echo "Remote URL: $(git remote get-url origin)"
  echo "Latest commit: $(git log -1 --oneline)"
}

# Git快速创建并切换到新分支
gnew() {
  git checkout -b "$1"
}