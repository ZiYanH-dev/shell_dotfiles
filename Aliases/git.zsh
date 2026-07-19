# ============================================================
# Git Aliases - Categorized
# ============================================================

# ---- Basic Operations ----
alias gs='git status'                    # Show working tree status
alias ga='git add'                       # Stage file(s)
alias gaa='git add -A'                   # Stage all changes
alias gc='git commit'                    # Commit staged changes
alias gcm='git commit -m'                # Commit with message
alias gca='git commit -a -m'             # Stage all tracked and commit

# ---- Remote Operations ----
alias gp='git push'                      # Push to remote
alias gpf='git push --force-with-lease'  # Force push (safer)
alias gpl='git pull'                     # Pull from remote
alias gf='git fetch'                     # Fetch without merging
alias gfa='git fetch --all'              # Fetch all remotes
alias gr='git remote'                    # Manage remotes
alias grv='git remote -v'                # Show remote URLs

# ---- Branching ----
alias gb='git branch'                    # List branches
alias gba='git branch -a'                # List all branches (incl. remote)
alias gbd='git branch -d'                # Delete branch (safe)
alias gbD='git branch -D'                # Delete branch (force)
alias gco='git checkout'                 # Switch branch
alias gcob='git checkout -b'             # Create and switch to new branch
alias gcm='git checkout main'            # Switch to main branch
alias gcd='git checkout develop'         # Switch to develop branch

# ---- Diff & Changes ----
alias gd='git diff'                      # Show unstaged changes
alias gds='git diff --staged'            # Show staged changes
alias gdw='git diff --word-diff'         # Word-level diff

# ---- Log & History ----
alias gl='git log'                       # Show commit log
alias glg='git log --graph --oneline --all --decorate'  # Pretty graph log
alias glo='git log --oneline'            # Compact one-line log
alias gls='git log --stat'               # Log with file stats

# ---- Stash ----
alias gst='git stash'                    # Stash changes
alias gstl='git stash list'              # List stashes
alias gstp='git stash pop'               # Apply and drop latest stash
alias gsta='git stash apply'             # Apply stash without dropping
alias gstd='git stash drop'              # Drop latest stash

# ---- Merge & Rebase ----
alias gm='git merge'                     # Merge branch
alias gmt='git mergetool'                # Launch merge tool
alias grb='git rebase'                   # Rebase
alias grbi='git rebase -i'               # Interactive rebase
alias grbc='git rebase --continue'       # Continue rebase
alias grba='git rebase --abort'          # Abort rebase

# ---- Reset & Undo ----
alias grs='git reset'                    # Unstage changes
alias grsh='git reset --hard'            # Reset to commit (destructive)
alias grss='git reset --soft'            # Reset to commit (keep changes)
alias grev='git revert'                  # Create undo commit

# ---- Cherry-pick & Others ----
alias gcp='git cherry-pick'              # Cherry-pick commit
alias gbl='git blame'                    # Show file line authors
alias gmv='git mv'                       # Move/rename file
alias grm='git rm'                       # Remove file from index

# ---- Cleanup ----
alias gclean='git clean -fd'             # Remove untracked files/dirs
alias gprune='git remote prune origin'   # Prune deleted remote branches

# ---- Tag & Info ----
alias gtag='git tag'                     # Manage tags
alias gshow='git show'                   # Show commit details
alias gcl='git clone'                    # Clone repository