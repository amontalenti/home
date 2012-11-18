# shortened file listings
alias ls='ls --color=auto --hide=*.pyc'
alias ll='ls -l'
alias la='ls -a'

# some handy shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias d='dirs -v'
alias svim='sudo vim'
alias ss='sudo -s'
alias topme='top -U`whoami`'
alias ptree="pstree -Gcpnulah"
alias rmpyc="find . -name '*.pyc' -delete"

# add some convenience options
alias grep="grep --color=auto --exclude-dir='.svn' --exclude-dir='.git'"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# safety
alias rm='rm -I'

alias notebook='ipython notebook --pylab=inline --ip=0.0.0.0'
alias himem5='mosh pixelmonkey@himem5.cogtree.com'
alias screencast="avconv -v warning -f x11grab -s 1366x768 -r 30 -i :0.0 -s 1366x768 -vcodec libx264 -threads 0 screencast.mp4"
