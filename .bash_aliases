# shortened file listings
alias ls='ls --color=auto --hide=*.pyc'
alias ll='ls -l'
alias la='ls -a'
# python shells
alias bpy='bpython-curtsies'
alias ipy='ipython'
# some handy cd shortcuts
alias ..="cd .."
alias ...="cd ../.."
# current stack state
alias d='dirs -v'
# privileged edit
alias svim='sudo vim'
# grab a sudo shell
alias ss='sudo -s'
# see truly every process running
alias ptree="pstree -Gcpnulah"
# simple Python cache cleaner
alias rmpyc="find . -name '*.pyc' -delete"
# add some convenience options to grep
alias grep="grep --color=auto --exclude-dir='.svn' --exclude-dir='.git'"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# safety
alias rm='rm -I'
# typical IPython Notebook options
alias notebook='ipython notebook --pylab=inline --port=9999'
# quick-and-easy screencasting tool
alias screencast="avconv -v warning -f x11grab -s 1366x768 -r 30 -i :0.0 -s 1366x768 -vcodec libx264 -threads 0 screencast.mp4"
# finds the pid(s) for any process
alias findpid='pgrep -fln'

# vagrant-specific
# ~~~~~~~~~~~~~~~~

# connect to Postgres REPL
alias v-psql='psql -h vagrant.cogtree.com -U parsely'
# connect to Cassandra REPL
alias v-cql='cqlsh vagrant.cogtree.com 9160'
# connect to Mongo REPL
alias v-mongo='mongo vagrant.cogtree.com'
# connect to Redis REPL
alias v-redis-cli='redis-cli -h vagrant.cogtree.com'

# share terminal via floobits
alias shareterm='flootty --owner="Parse.ly" --workspace=interviews --create AM'
# share directory via floobits
alias sharedir='floomatic --read-only --join "https://floobits.com/r/Parse.ly/interviews/" ~/src/interviews'
