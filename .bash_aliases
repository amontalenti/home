# shortened file listings
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lh='ls --hide="*.pyc"'

# some handy shortcuts
alias d='dirs -v'
alias svim='sudo vim'
alias ss='sudo -s'
alias topme='top -U`whoami`'
alias ptree="pstree -Gcpnulah"

# add some convenience options
alias grep="grep --color=auto --exclude-dir='.svn' --exclude-dir='.git'"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# safety
alias rm='rm -I'

alias notebook='ipython notebook --pylab=inline --ip=0.0.0.0'
alias himem5='mosh pixelmonkey@himem5.cogtree.com'
