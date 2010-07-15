export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/.bin

export DISPLAY=:0.0
export EDITOR=mvim
export GEM_EDITOR=mvim

# Shortcut to SSH into Fran's box.
alias irc='ssh lmarb@lukesh.com'

# Use hub: http://github.com/defunkt/hub
alias git=hub

# git aliases
alias g='git'
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
alias jek="rm -rf _site && jekyll --server --auto --pygments"

# Create a new screen session with the name "slime"
alias s="screen -S slime"

# Restart Apache
alias are="sudo apachectl restart"

# QuickLook an image
alias ql='qlmanage -p 2>/dev/null'

# Load the git prompt script.
source ~/.git-prompt

# Load git autocompletion script.
source ~/.git-completion

# Homebrew completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

exec_last_feature_or_test() {
  history|sort -r|sed 's/^  [0-9]*  //'|while read i;do if [[ "$i" =~ ^ruby || "$i" =~ ^rspec || "$i" =~ ^cucumber ]];then echo $i|sh;exit;fi;done
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
stty stop undef

# rvm installer added line:
if [[ -s /Users/Larry/.rvm/scripts/rvm ]] ; then source /Users/Larry/.rvm/scripts/rvm ; fi
