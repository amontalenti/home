# shortened file listings
alias ls="ls --color=auto --hide='*.pyc' --hide='__pycache__' --hide='*egg-info'"
alias ll='ls -l'
alias la='ls -a'
alias lt='ls -t | head'
# cleaner disk free
alias df='df -xsquashfs -xtmpfs'
alias lsmount="mount | grep '^/' | grep -v 'snapd/'"
alias lslog="ls . | egrep '\.log$'"
# current stack state
alias d='dirs -v'
# privileged edit
alias svim='sudo vim'
# grab a sudo shell
alias ss='sudo -s'
# see truly every process running
alias ptree="pstree -Gcpnulah"
# better repetitive top-like stats
alias dtop="dstat -ta"
# simple Python cache cleaner
alias rmpyc="find . -name '*.pyc' -delete"
# equivalent to OS X "open"
alias open="xdg-open"
# add some convenience options to grep
alias grep="grep --color=auto --exclude-dir='.svn' --exclude-dir='.git'"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# finds the pid(s) for any process
alias findpid='pgrep -fln'
# upgrade
alias upgrade='sudo apt update && sudo apt upgrade'
# json pretty printer
alias jsonprint='python -m json.tool'
# backup helper
alias irestic='sudo -u restic -i'
# gksu was removed from 20.04
alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'

# apps
# ~~~~
#
# note-taking app in vim
alias simplenote='vim -c "SimplenoteList"'
# look for wireless noise
alias kismet='kismet -n'
# make a long (silent) screencast video tool
alias screencast="avconv -v warning -f x11grab -s 1360x768 -r 30 -i :0.0 -s 1366x768 -vcodec libx264 -threads 0 screencast.mp4"
# make a quick 30-second gif screencast
alias gifcast='byzanz-record -v -c -d 30 --delay 5 screencast.gif'
# quick gcal agenda
alias gcal='gcalcli agenda --calendar="AM - Parse.ly" --calendar="AM - Personal" --calendar="Shared - Team"'
# turn HTML in clipboard to clipboard.md file
alias clipmd='(xclip -o -selection clipboard -t text/html | pandoc -r html --wrap=none -o /tmp/clipboard.md) && cat /tmp/clipboard.md && echo Stored in: /tmp/clipboard.md'

# python
# ~~~~~~
#
# python shells
alias ipy='ipython'
alias nb='ipython notebook'
# spark + python integration
alias ipyspark='PYSPARK_DRIVER_PYTHON=ipython pyspark --packages com.amazonaws:aws-java-sdk-pom:1.10.34,org.apache.hadoop:hadoop-aws:2.7.2'
alias ipysparknotebook='PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark --packages com.amazonaws:aws-java-sdk-pom:1.10.34,org.apache.hadoop:hadoop-aws:2.7.2'

alias pe="pyenv shell"
alias py2="pyenv activate py2"
alias py3="pyenv activate py3"
alias pyenv-pythons="pyenv versions | awk '{print \$1}' | grep -v '/' | grep '^\(2\|3\).*'"
alias pyenv-envs="pyenv versions | awk '{print \$1}' | grep -v '/'"
alias pipthis="pip install -r requirements.txt"
# force installation of fresh package with pip
alias pipinstall="pip install --no-cache-dir -I"
alias pipupgrade="pip install --upgrade --upgrade-strategy only-if-needed"
# clean up a badly set up pip dependency folder by uninstalling everything
alias pipcleanall="pip freeze | grep -v '^-e ' | xargs pip uninstall -y"

# vagrant and docker aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~

# connect to Postgres shell
alias v-psql='psql -h vagrant.cogtree.com -U parsely'
alias d-psql='psql -h localhost -U parsely'
# connect to Postgres REPL
alias v-pgcli='pgcli -h vagrant.cogtree.com -U parsely'
alias d-pgcli='pgcli -h localhost -U parsely'
# connect to Cassandra REPL
alias v-cql='cqlsh vagrant.cogtree.com 9160'
alias d-cql='cqlsh localhost 9160'
# connect to Mongo REPL
alias v-mongo='mongo vagrant.cogtree.com'
alias d-mongo='mongo localhost'
# connect to Redis REPL
alias v-redis-cli='redis-cli -h vagrant.cogtree.com -p 6379'
alias d-redis-cli='redis-cli -h localhost -p 6379'
# connect to Elasticsearch REPL (Python)
alias v-es="ipython -i -c \"from elasticsearch import Elasticsearch as ES; es = ES('vagrant.cogtree.com'); print('\nElasticSearch: use es\n')\""
alias d-es="ipython -i -c \"from elasticsearch import Elasticsearch as ES; es = ES('localhost'); print('\nElasticSearch: use es\n')\""

# Clojure
# ~~~~~~~

# runs a background Clojure server
alias clj-server='lein trampoline repl :headless'
# quick run repl
alias clj-repl='grench repl'
# quick run lein
alias clj-lein='grench lein'

# multiplex'ed tmux ssh sessions
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# pixel servers
alias ssh-pixel='ssh-multi {ue1{a,b,d,e}-pixel{1,2},uw2{a,b,c}-pixel{1,2}}.cogtree.com'
alias ssh-pixel-east='ssh-multi ue1{a,b,d,e}-pixel{1,2}.cogtree.com'
alias ssh-pixel-west='ssh-multi uw2{a,b,c}-pixel{1,2}.cogtree.com'
# dash app server
alias ssh-dash-web='ssh-multi ue1a-dash-web{1,2,3,4,5}.cogtree.com'
# api servers
alias ssh-api='ssh-multi ue1a-api{1,2,3,4,5,6,7}.cogtree.com'
# ba servers
alias ssh-ba='ssh-multi ue1{a,b,e}-ba-prod1{a,b,c,d,e,f,g,h}.cogtree.com'

# hack machine in gcloud
alias ssh-hack='gcloud compute --project "steady-cat-128117" ssh --zone "us-east1-c" "hack"'
alias stop-hack='gcloud compute instances stop --project "steady-cat-128117" --zone "us-east1-c" "hack"'
alias start-hack='gcloud compute instances start --project "steady-cat-128117" --zone "us-east1-c" "hack"'
