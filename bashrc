export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/.bin
export MANPATH=/opt/local/share/man:$MANPATH  # MacPorts man pages.

export DISPLAY=:0.0
export EDITOR=mvim

# Use hub: http://github.com/defunkt/hub
alias git=hub

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

# Open the current direcotry in MacVim
alias m='mvim .'
alias e='mvim'

# Rails aliases
alias ss='./script/server'
alias sc='./script/console'
alias gen="script/generate"
alias mig="rake db:migrate && rake db:test:prepare"

# Testing aliases
alias aut='autotest'
alias cuc='rake cucumber'

# Shortcut to start mongod
alias mongo='mongod run --config /usr/local/Cellar/mongodb/1.2.0-x86_64/mongod.conf'

# Remove the generated _site directory and start the Jekyll server.
alias jek="rm -rf _site && jekyll --server --auto --pygments"

# Create a new screen session with the name "s0"
alias s="screen -S s0"

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

# rvm installer added line:
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
