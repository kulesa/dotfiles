# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

set -o vi

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="edvardm"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

plugins=(cap git lein vagrant)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH:/Developer/usr/bin
export MANPATH=/usr/local/man
export LANG=en_US.UTF-8
source ~/.profile


# AWS Settings
export AWS_HOME=~/.aws
export EC2_HOME=$AWS_HOME/cli_tools/ec2-api-tools
export AWS_AUTO_SCALING_HOME=$AWS_HOME/cli_tools/as-api-tools
export PATH=$PATH:$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin
export EC2_PRIVATE_KEY=$AWS_HOME/pk-ec2.pem
export EC2_CERT=$AWS_HOME/cert-ec2.pem
export AWS_CREDENTIAL_FILE=$AWS_HOME/credentials
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

touch ~/.bookmarks
source ~/.bookmarks
# Customize to your needs...
if [[ -s /Users/pro/.rvm/scripts/rvm ]] ; then source /Users/pro/.rvm/scripts/rvm ; fi

export PATH=$PATH:/usr/local/Trolltech/Qt-4.7.4/bin
export EDITOR="vim"
export DISABLE_AUTO_TITLE="true"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
unsetopt correct

alias map="xargs -n1"
alias bra="bundle exec rake"
alias b="bundle"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# alias git to hub
eval "$(hub alias -s)"

# vi mode
bindkey -v
#
# The time the shell waits, in hundredths of seconds, for another key
# to be pressed when reading bound multi-character sequences.
#
# Set to shortest possible delay is 1/100 second.
# This allows escape sequences like cursor/arrow keys to work,
# while eliminating the delay exiting vi insert mode.
KEYTIMEOUT=1

# Ctrl-R for reverse incremental search
bindkey "^R" history-incremental-search-backward

# Ruby GC tuning
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000
