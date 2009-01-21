export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export DISPLAY=:0.0

# git
alias gst='git status'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -va'
alias gb='git branch'
alias gba='git branch -a'

# git svn
alias gs='git svn'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'

# Run autotest
alias aut='autotest'

# Start local Rails server
alias ss='./script/server'

# Open TextMate for the current directory
alias m='mate .'

# Open TextMate for the current directory and start script/server
alias ms='m && ss'

# Launch GitX in commit mode.
alias gx='gitx -c'