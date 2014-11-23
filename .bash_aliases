# shortened file listings
alias ls="ls --color=auto --hide='*.pyc'"
alias ll='ls -l'
alias la='ls -a'
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
# finds the pid(s) for any process
alias findpid='pgrep -fln'

# apps
# ~~~~
#
# note-taking app in vim
alias simplenote='vim -c "Simplenote -l"'
# look for wireless noise
alias kismet='kismet -n'
# make a long (silent) screencast video tool
alias screencast="avconv -v warning -f x11grab -s 1360x768 -r 30 -i :0.0 -s 1366x768 -vcodec libx264 -threads 0 screencast.mp4"
# make a quick 30-second gif screencast
alias gifcast='byzanz-record -v -c -d 30 --delay 5 screencast.gif'

# python
# ~~~~~~
#
# python shells
alias bpy='bpython-curtsies'
alias ipy='ipython'
# typical IPython Notebook options
alias notebook='ipython notebook --pylab=inline'
# spark + python integration
alias ipyspark='IPYTHON=1 pyspark'
alias ipysparknotebook='IPYTHON_OPTS="notebook --pylab inline" pyspark'

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

# Clojure
# ~~~~~~~

# runs a background Clojure server
alias clj-server='lein trampoline repl :headless'
# quick run repl
alias clj-repl='grench repl'
# quick run lein
alias clj-lein='grench lein'

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
# dash app servers
alias ssh-dash-web='ssh-multi ue1a-dash-web{1,2,3,4,5,6}'
# ptrack mongo
alias ssh-parsely-mongo='ssh-multi ue1a-parsely-mongo1{a,b,c,d}'
# crawl mongo
alias ssh-crawl-mongo='ssh-multi ue1a-crawl-mongo1{a,b,c}'
# api servers
alias ssh-api='ssh-multi ue1a-api{1,2,3,4,5,6}'
# solr servers
alias ssh-solr='ssh-multi ue1a-solr{1,2,3}'
# crawl servers
alias ssh-crawl='ssh-multi ue1a-crawl{1,2,3}'
# storm cluster (1)
alias ssh-storm1='ssh-multi ue1a-storm{1,2,3}'
# storm cluster (2)
alias ssh-storm2='ssh-multi ue1a-storm{4,5,6}'
# kafka cluster
alias ssh-kafka='ssh-multi ue1a-kafka{1,2,3}'
# zk cluster (1)
alias ssh-zk1='ssh-multi ue1a-zk{1,2,3}'
# zk cluster (2)
alias ssh-zk2='ssh-multi ue1a-zk{4,5,6}'
# zk cluster (api)
alias ssh-api-zk='ssh-multi ue1a-api-zk{1,2,3}'
# Cassandra cluster
alias ssh-cass1='ssh-multi ue1a-cass1{a,b,c,d,e}'
# Elasticsearch cluster
alias ssh-es1='ssh-multi ue1a-es1{a,b,c,d,e}'
