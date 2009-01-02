export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export DISPLAY=:0.0

# git aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -va'
alias gdc='git svn dcommit'
alias gb='git branch'
alias gba='git branch -a'
alias gs='git svn'
alias gsr='git svn rebase'

# Run autotest
alias aut='autotest'

# Open TextMate for the current directory and start script/server
alias ms='mate . && ./script/server'