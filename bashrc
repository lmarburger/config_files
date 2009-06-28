export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH:~/.bin
export DISPLAY=:0.0
export EDITOR=mate

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

# Start local Rails server and console
alias ss='./script/server'
alias sc='./script/console'

# Open TextMate for the current directory
alias m='mate .'

# Open TextMate for the current directory and start script/server
alias ms='m && ss'

# Launch GitX and show all branches.
alias gx='gitx --all'

# Launch GitX in commit mode.
alias gxc='gitx -c'

# Hack && Ship - http://reinh.com/blog/2008/08/27/hack-and-and-ship.html
alias hs="hack && rake && ship"

# Bedazzle Your Bash Prompt with Git Info
#   http://www.railstips.org/2009/2/2/bedazzle-your-bash-prompt-with-git-info
#   http://www.intridea.com/posts/git-status-in-your-prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
RESET="\[\033[0;37;00m\]"

# export PS1='\u:\[\033[31;40m\]\w\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]$ '
PS1="\w$YELLOW \$(parse_git_branch)$RESET\$ "

# Load git autocompletion script.
source ~/.git-completion

# Screen config
if [ "$TERM" = "screen" -a ! "$SHOWED_SCREEN_MESSAGE" = "true" ]; then
  detached_screens=`screen -list | grep Detached`
  if [ ! -z "$detached_screens" ]; then
    echo "+---------------------------------------+"
    echo "| Detached screens are available:       |"
    echo "$detached_screens"
    echo "+---------------------------------------+"
  else
    echo "[ screen is activated ]"
  fi
  export SHOWED_SCREEN_MESSAGE="true"
fi
