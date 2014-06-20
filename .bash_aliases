# shortened file listings
alias ls="ls --color=auto --hide='*.pyc'"
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
# connect to Elasticsearch REPL (Python)
alias v-es="ipython -i -c \"from elasticsearch import Elasticsearch as ES; es = ES('vagrant.cogtree.com'); print('\nElasticSearch: use es\n')\""

# Floobits
# ~~~~~~~~

# share terminal via floobits
alias shareterm='flootty --owner="Parse.ly" --workspace=interviews --create AM'
# share directory via floobits
alias sharedir='floomatic --read-only --join "https://floobits.com/r/Parse.ly/interviews/" ~/src/interviews'

# multiplex'ed tmux ssh sessions
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# config servers
alias ssh-config='ssh-multi ue1a-config1 ue1a-config2 ue1b-config1 ue1b-config2 ue1e-config1 ue1e-config2 uw2a-config1 uw2b-config1 uw2c-config1'
# pixel servers
alias ssh-pixel='ssh-multi ue1a-pixel1 ue1a-pixel2 ue1b-pixel1 ue1b-pixel2 ue1e-pixel1 ue1e-pixel2'
# dash servers
alias ssh-dash-web='ssh-multi ue1a-dash-web1 ue1a-dash-web2 ue1a-dash-web3 ue1a-dash-web4 ue1a-dash-web5 ue1a-dash-web6'
# ptrack Mongo servers
alias ssh-parsely-mongo='ssh-multi ue1a-parsely-mongo1a ue1a-parsely-mongo1b ue1a-parsely-mongo1c ue1a-parsely-mongo1d'
# crawl Mongo servers
alias ssh-crawl-mongo='ssh-multi ue1a-crawl-mongo1a ue1a-crawl-mongo1b ue1a-crawl-mongo1c'
# api servers
alias ssh-api='ssh-multi ue1a-api1 ue1a-api2 ue1a-api3'
# Solr servers
alias ssh-solr='ssh-multi ue1a-solr1 ue1a-solr2 ue1a-solr3'
# crawl servers
alias ssh-crawl='ssh-multi ue1a-crawl1 ue1a-crawl2 ue1a-crawl3'
# first storm cluster
alias ssh-storm1='ssh-multi ue1a-storm1 ue1a-storm2 ue1a-storm3'
# second storm cluster
alias ssh-storm2='ssh-multi ue1a-storm4 ue1a-storm5'
# Kafka cluster
alias ssh-kafka='ssh-multi ue1a-kafka1 ue1a-kafka2 ue1a-kafka3'
# first zk cluster
alias ssh-zk1='ssh-multi ue1a-zk1 ue1a-zk2 ue1a-zk3'
# second zk cluster
alias ssh-zk2='ssh-multi ue1a-zk4 ue1a-zk5 ue1a-zk6'
# API zk cluster
alias ssh-api-zk='ssh-multi ue1a-api-zk1 ue1a-api-zk2 ue1a-api-zk3'
# himem servers
alias ssh-himem='ssh-multi himem1 himem2 himem3 himem4 himem5'
# Cassandra cluster
alias ssh-cass='ssh-multi ue1a-cass1a ue1a-cass1b ue1a-cass1c'
# Elasticsearch cluster
alias ssh-es='ssh-multi ue1a-es1a ue1a-es1b ue1a-es1c'
