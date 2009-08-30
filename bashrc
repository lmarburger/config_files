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
alias m='mvim .'

# Rails aliases
alias ss='./script/server'
alias sc='./script/console'
alias gen="script/generate"
alias mig="rake db:migrate && rake db:test:prepare"

# Testing aliases
alias aut='autotest'
alias rc='rake cucumber'

# Remove the generated _site directory and start the Jekyll server.
alias jek="rm -rf _site && jekyll --server --auto --pygments"


# Load the git prompt script.
source ~/.git-prompt

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

# Allow ctrl-s to reverse through bash history (ctrl-r)
stty stop undef

