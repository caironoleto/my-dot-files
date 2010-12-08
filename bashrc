system_name=`uname -s` # Sets 'Darwin' or 'Linux' etc

source ~/.exports
source ~/.gitrc
source ~/.aliases
source ~/.save-directory

if [ $system_name == 'Darwin' ]; then
  source ~/.gemdoc
  source ~/.terminal
else
  if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
  fi
fi

# if ["$PS1"]; then
# 	complete -cf sudo
# fi

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
# shopt -s globstar

complete -C ~/.rake-completion.rb -o default rake
# if [ -f ~/.rvm/bin/rvm ] ; then source ~/.rvm/bin/rvm ; fi
source ~/.rvm/scripts/rvm
	
export JAVA_HOME=/Library/Java/Home
export NUTCH_JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=/Library/Tomcat/Home
export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=/Library/Tomcat/Home/solr"

export PATH=/Users/caironoleto/.rvm/bin:/Library/Java/Home:/opt/local/bin:/opt/local/sbin:/Users/caironoleto/Sites/Codes/homebrew/bin:$PATH
