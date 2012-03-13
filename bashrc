system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

source ~/.exports
source ~/.gitrc
source ~/.aliases
source ~/.save-directory

if [ $system_name == 'Darwin' ]; then
  source ~/.gemdoc
  source ~/.terminal
fi

PS1='\n[\t \u] \[\033[1;33m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")'
PS1="$PS1 \[\033[1;32m\](\$(~/.rvm/bin/rvm-prompt))\[\033[0m\] \n\$ "

function __pair_status {
  hitchstatus " %s";
}

# readline settings
bind "set completion-ignore-case on" 
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

shopt -s checkwinsize
shopt -s histappend

if [ $system_name == 'Darwin' ]; then
  complete -C ~/.rake-completion.rb -o default rake
fi
source ~/.rvm/scripts/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
