export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/.bin

export DISPLAY=:0.0
export EDITOR=mvim

# Use hub: http://github.com/defunkt/hub
alias git=hub

# Use gem-man
alias man='gem man -s'

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

# GitX aliases
alias gx=gitx
alias gxc='gitx -c'

# Open the current direcotry in MacVim
alias m='mvim .'
alias e='mvim'
alias em='open -a /Applications/Emacs.app'

# Rails aliases
alias r='rails'
alias mig="rake db:migrate && rake db:migrate:redo && rake db:test:prepare"

# Rails 2.x aliases
alias ss='./script/server'
alias sc='./script/console'
alias gen="script/generate"

# Testing aliases
alias aut='autotest'
alias cuc='rake cucumber'

# Check which Ruby version I'm using
alias rv='ruby --version'

# Shortcut to start mongod
alias mongo='mongod run --config /usr/local/Cellar/mongodb/1.2.3-x86_64/mongod.conf'

# Remove the generated _site directory and start the Jekyll server.
alias jek="rm -rf _site && jekyll --server --auto --pygments"

# Create a new screen session with the name "slime"
alias s="screen -S slime"

# Load the git prompt script.
source ~/.git-prompt

# Load git autocompletion script.
source ~/.git-completion

# -- start rip config -- #
RIPDIR=/Users/Larry/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #

# Allow ctrl-s to reverse through bash history (ctrl-r)
stty stop undef

# rvm installer added line:
if [[ -s /Users/Larry/.rvm/scripts/rvm ]] ; then source /Users/Larry/.rvm/scripts/rvm ; fi
