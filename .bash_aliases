# shortened file listings
alias ls="ls --color=auto --hide='*.pyc' --hide='__pycache__' --hide='*egg-info'"
alias ll='ls -l'
alias la='ls -a'
alias lt='ls -t | head'
# cleaner disk free
alias df.real='df -xsquashfs -xtmpfs'
alias duf.clean="duf --hide-mp '/dev*,/run*,/sys*'"
alias duf.root="duf --only-mp '/,/home'"
# shows cleaner mount points, without snap noise
alias mnt.grep="mount | grep '^/' | grep -v 'snapd/'"
# find clean mount points, only real and readable + writable
alias mnt.find='findmnt --options rw --real'
# find .log files in current directory
alias lslog="ls . | egrep '\.log$'"
# current stack state
alias d='dirs -v'
# privileged edit
alias svim='sudo vim'
# grab a sudo shell
alias ss='sudo -s'
# see truly every process running
alias ptree="pstree -Gcpnulah"
# better repetitive top-like stats, good for comparison over time
alias dtop="dstat -ta"
# simple Python cache cleaner
alias rmpyc="find . -name '*.pyc' -delete"
# equivalent to OS X "open"
alias open="xdg-open"
# add some convenience options to grep
alias grep="grep --color=auto --exclude-dir='.git'"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# finds the pid(s) for any process
alias findpid='pgrep -fln'
# json pretty printer
alias jsonprint='python -m json.tool'
# backup helper
alias irestic='sudo -u restic -i'
# gksu was removed from 20.04
alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'
# gedit was replaced in 24.04
alias gedit='gnome-text-editor'
# dmesg of last boot, via journalctl
alias dmesg-this='journalctl --no-hostname -o short-precise -k -b 0'
alias dmesg-last='journalctl --no-hostname -o short-precise -k -b -1'
alias dmesg-xorg='journalctl --no-hostname -o short-precise -b /usr/bin/Xorg'
alias battery-status='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
# bat is cat with syntax highlighting, via batcat
alias bat='batcat'
alias youtube-dl='yt-dlp'
alias sloc='tokei'
# check files in current directory missing from amontalenti/home
alias missing='cp ~/.gitignore ~/.gitignore.bak && echo "#*" > ~/.gitignore && git s; mv ~/.gitignore.bak ~/.gitignore'
alias gitmissing=missing
alias ripgrep='rg --no-ignore-parent'
alias ripgrep.all='rga --no-ignore-parent'
alias ripgrep.binary='ripgrep.all'
alias ripgrep.multiline='ripgrep --multiline'
alias ripgrep.zip='ripgrep --search-zip'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# apps
# ~~~~
#
# make a long (silent) screencast video tool
alias screencast="avconv -v warning -f x11grab -s 1360x768 -r 30 -i :0.0 -s 1366x768 -vcodec libx264 -threads 0 screencast.mp4"
# make a quick 30-second gif screencast
alias gifcast='byzanz-record -v -c -d 30 --delay 5 screencast.gif'
# turn HTML in clipboard to clipboard.md file
alias clipmd='(xclip -o -selection clipboard -t text/html | pandoc -r html --wrap=none -o /tmp/clipboard.md) && cat /tmp/clipboard.md && echo Stored in: /tmp/clipboard.md'

# show wifi password and QR code
alias wifi-password='nmcli dev wifi show-password'
alias wifi-qrcode=wifi-password

# bfg for git cleanup
alias bfg='java -jar ~/opt/bin/bfg-1.14.0.jar'

# python
# ~~~~~~

# python shells
alias ipy='ipython'
alias nb='ipython notebook'

# spark + python integration example
alias ipyspark='PYSPARK_DRIVER_PYTHON=ipython pyspark --packages com.amazonaws:aws-java-sdk-pom:1.10.34,org.apache.hadoop:hadoop-aws:2.7.2'
alias ipysparknotebook='PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark --packages com.amazonaws:aws-java-sdk-pom:1.10.34,org.apache.hadoop:hadoop-aws:2.7.2'

alias pe="pyenv shell"
alias py2="pyenv activate py2"
alias py3="pyenv activate py3"

# pyenv
alias pyenv-pythons="pyenv versions | awk '{print \$1}' | grep -v '/' | grep '^\(2\|3\).*'"
alias pyenv-envs="pyenv versions | awk '{print \$1}' | grep -v '/'"

# pip
alias pipthis="pip install -r requirements.txt"
# force installation of fresh package with pip
alias pipinstall="pip install --no-cache-dir -I"
alias pipupgrade="pip install --upgrade --upgrade-strategy only-if-needed"
# clean up a badly set up pip dependency folder by uninstalling everything
alias pipcleanall="pip freeze | grep -v '^-e ' | xargs pip uninstall -y"

# docker aliases
# ~~~~~~~~~~~~~~

# connect to Postgres shell
alias d-psql='psql -h localhost -U parsely'
# connect to Postgres REPL
alias d-pgcli='pgcli -h localhost -U parsely'
# connect to Cassandra REPL
alias d-cql='cqlsh localhost 9160'
# connect to Mongo REPL
alias d-mongo='mongo localhost'
# connect to Redis REPL
alias d-redis-cli='redis-cli -h localhost -p 6379'
# connect to Elasticsearch REPL (Python)
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

# ssh-multi examples
alias ssh-workers='ssh-multi worker{a,b,c}'
alias ssh-webs='ssh-multi web{1,2,3}'
