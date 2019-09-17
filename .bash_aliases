# Some useful aliases
# vi:filetype=sh:
alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo "alias $name='$value'" >> ~/.bash_aliases
   eval "alias $name='$value'"
   alias $name
}

#######
# git #
#######
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch -v'

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

function st {
  if [ -d ".svn" ]; then
    svn status
  else
    git status
  fi
}

#######
# SVN #
#######
alias sup='svn up' # trust me 3 chars makes a different
# alias sstu='svn st -u' # remote repository changes
# alias scom='svn commit' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

########
# RUBY #
########
# really awesome function, use: cdgem <gem name>, cd's into your gems directory
# and opens gem that best matches the gem name provided
function cdgem {
  cd `gem env gemdir`/gems
  cd `ls | grep $1 | sort | tail -1`
}
function gemdoc {
  GEMDIR=`gem env gemdir`/doc
  open $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`/rdoc/index.html
}
function mategem {
  GEMDIR=`gem env gemdir`/gems
  mate $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`
}

alias qri='qri -w 98'
alias fri='fri -w 98'

#########
# RAILS #
#########

# console
function sc() {
  if [ -x script/rails ]; then
    script/rails console
  elif [ -x script/console ]; then
    script/console
  else
    echo "no script/rails or script/console found" >&2
  fi
}

# server
function ss() {
  if [ -x script/rails ]; then
    script/rails server
  elif [ -x script/server ]; then
    script/server
  else
    echo "no script/rails or script/server found" >&2
  fi
}

# stop daemonized Rails server
function sst() {
  if [ -f tmp/pids/mongrel.pid ]; then
    echo "Stopping Mongrel ..."
    kill `cat tmp/pids/mongrel.pid`
  elif [ -f tmp/pids/server.pid ]; then
    echo "Stopping server ..."
    kill `cat tmp/pids/server.pid`
  fi
}

# restart Rails application
function sr() {
  if [ -f tmp/pids/mongrel.pid ]; then
    echo "Restarting Mongrel ..."
    kill -USR2 `cat tmp/pids/mongrel.pid`
  elif [ -f tmp/pids/server.pid ]; then
    echo "Restarting server ..."
    kill -USR2 `cat tmp/pids/server.pid`
  else
    echo "Restarting Passenger instances ..."
    touch tmp/restart.txt
  fi
}

# see http://railstips.org/2007/5/31/even-edgier-than-edge-rails
function edgie() { 
  ruby ~/.coral/rails/rails/railties/bin/rails $1 && cd $1 && ln -s ~/.coral/rails/rails vendor/rails
}

########
# misc #
########

alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'
alias h='history'
alias j="jobs -l"
alias l="ls -lah"
alias ll="ls -l"
alias la='ls -A'
# alias pu="pushd"
# alias po="popd"

# mojombo http://gist.github.com/180587
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

#
# Csh compatability:
#
alias unsetenv=unset
function setenv () {
  export $1="$2"
}

########
# mongo
########

alias monstar="mongod --dbpath ~/dev/js/"

########
# node
########

alias cs='coffee app.coffee'
alias nos='node app.js'
