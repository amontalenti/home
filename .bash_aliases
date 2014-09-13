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
alias simplenote='vim -c "Simplenote -l"'
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
alias v-cql='TZ=UTC cqlsh vagrant.cogtree.com 9160'
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
alias ssh-config='ssh-multi ue1a-config{1,2} ue1b-config{1,2} ue1e-config{1,2} uw2a-config{1,2} uw2c-config1'
# pixel servers
alias ssh-pixel='ssh-multi ue1{a,b,e}-pixel1, uw2{a,b}-pixel1'
# dash servers
alias ssh-dash-web='ssh-multi ue1a-dash-web{1,2,3,4,5,6}'
# ptrack Mongo servers
alias ssh-parsely-mongo='ssh-multi ue1a-parsely-mongo1{a,b,c,d}'
# crawl Mongo servers
alias ssh-crawl-mongo='ssh-multi ue1a-crawl-mongo1{a,b,c}'
# api servers
alias ssh-api='ssh-multi ue1a-api{1,2,3,4,5,6}'
# Solr servers
alias ssh-solr='ssh-multi ue1a-solr{1,2,3}'
# crawl servers
alias ssh-crawl='ssh-multi ue1a-crawl{1,2,3}'
# first storm cluster
alias ssh-storm1='ssh-multi ue1a-storm{1,2,3}'
# second storm cluster
alias ssh-storm2='ssh-multi ue1a-storm{4,5,6}'
# Kafka cluster
alias ssh-kafka='ssh-multi ue1a-kafka{1,2,3}'
# first zk cluster
alias ssh-zk1='ssh-multi ue1a-zk{1,2,3}'
# second zk cluster
alias ssh-zk2='ssh-multi ue1a-zk{4,5,6}'
# API zk cluster
alias ssh-api-zk='ssh-multi ue1a-api-zk{1,2,3}'
# himem servers
alias ssh-himem='ssh-multi himem{1,2,3,4,5}'
# Cassandra cluster
alias ssh-cass='ssh-multi ue1a-cass1{a,b,c,d,e}'
# Elasticsearch prototype cluster
alias ssh-es1='ssh-multi ue1a-es1{a,b,c,d,e}'
# Elasticsearch new cluster: master nodes
alias ssh-es3m='ssh-multi ue1a-es3-m1{a,b,c}'
# Elasticsearch new cluster: query nodes
alias ssh-es3q='ssh-multi ue1a-es3-d1{c,d,e}'
# Elasticsearch new cluster: indexing nodes only
alias ssh-es3i='ssh-multi ue1a-es3-d1{a,b}'
