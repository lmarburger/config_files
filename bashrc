export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH:~/.bin
export DISPLAY=:0.0
export EDITOR=mate

# git aliases
alias gst='git status'
alias gb='git branch'
alias gba='git branch -a'
alias pull='git pull'
alias push='git push'

# git-svn aliases
alias gs='git svn'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'

# Open GitHub for the current git repo if applicable.
alias github='br=$(git branch --contains HEAD | sed -En "s/^\* //p"); if ! git ls-remote . | grep -q -e "refs/remotes/.*/${br}"; then br="master"; fi; open $(git config -l | sed -En "s%remote.origin.url=git(@|://)(github.com)(:|/)(.+/.+).git%https://\2/\4/tree/${br}%p")'

# GitX aliases
alias gx='gitx --all'
alias gxc='gitx -c'

# Open the current direcotry in TextMate
alias m='mate .'

# Rails aliases
alias ss='./script/server'
alias sc='./script/console'
alias gen="script/generate"
alias mig="rake db:migrate && rake db:test:prepare"

# Testing aliases
alias aut='autotest'
alias rf="rake features"

# Remove the generated _site directory and start the Jekyll server.
alias jek="rm -rf _site && jekyll --server --auto --pygments"


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

# -- start rip config -- #
RIPDIR=/Users/Larry/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
