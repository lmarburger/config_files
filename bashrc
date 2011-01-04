export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/.bin

export DISPLAY=:0.0
export EDITOR=mvim
export GEM_EDITOR=mvim

# Colors ----------------------------------------------------------
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors

# ls with colors
alias ls='ls -G'

# Shortcut to SSH into Fran's box.
alias irc='ssh lmarb@lukesh.com'

# Use hub: http://github.com/defunkt/hub
alias git=hub

# git aliases
alias g='git'
alias gst='git status -s'
alias gb='git branch'
alias gba='git branch -a'
alias pull='git pull --rebase'
alias pulls='git stash && git pull --rebase && git stash pop'
alias push='git push'

# git-svn aliases
alias gs='git svn'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'

# GitX aliases
alias gx='gitx --all'
alias gxc='gitx --commit'

# Open the current direcotry in MacVim
alias m='mvim .'
alias e='mvim'
alias em='open -a /Applications/Emacs.app'

# Rails aliases
alias r='rails'
alias mig="rake db:migrate && rake db:migrate:redo && rake db:test:prepare"
alias b='bundle'
alias br='bundle install --relock'
alias h='heroku'

# Rails 2.x aliases
alias ss='./script/server'
alias sc='./script/console'
alias gen="script/generate"

# Testing aliases
alias aut='autotest'
alias cuc='rake cucumber'
alias tc='rake test && rake cucumber'

# Check which Ruby version I'm using
alias rv='ruby --version'

# Some services
alias mem="memcached -d"
alias post="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias post_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Shortcut to start mongod
#alias mongo='mongod run --config /usr/local/Cellar/mongodb/1.2.3-x86_64/mongod.conf'

# Remove the generated _site directory and start the Jekyll server.
alias jek="rm -rf _site && bundle exec jekyll --server --auto --pygments"
alias ejek="rm -rf _site && bundle exec ejekyll --server --auto --pygments"

# Create a new screen session with the name "slime"
alias s="screen -S slime"

# Restart Apache
alias are="sudo apachectl restart"

# QuickLook an image
alias ql='qlmanage -p 2>/dev/null'

# Run input through json gem
alias pj=prettify_json.rb

# Shotcut to pipe input to the clipboard
alias pc=pbcopy

# Load the git prompt script.
source ~/.git-prompt

# Load git autocompletion script.
source ~/.git-completion

# Homebrew completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

exec_last_feature_or_test() {
  history|sort -r|sed 's/^ *[0-9]*  //'|while read i;do if [[ "$i" =~ ^ruby || "$i" =~ ^r?spec || "$i" =~ ^(bundle exec )?cucumber ]];then echo $i|sh;exit;fi;done
}

dusort() {
  du -kd 1 | sort -nr | awk '
    BEGIN {
      split("KB,MB,GB,TB", Units, ",");
    }
    {
      u = 1;
      while ($1 >= 1024) {
        $1 = $1 / 1024;
        u += 1
      }
      $1 = sprintf("%.1f %s", $1, Units[u]);
      print $0;
    }
    '
}

# Allow ctrl-s to reverse through bash history (ctrl-r)
#stty stop undef

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# REE tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
