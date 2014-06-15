export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ampy"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git github
         python virtualenv virtualenvwrapper
         tmux
         vagrant
         fabric
         lein
         npm
         sudo)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/storm/bin/:/opt/vagrant/bin/:/home/pixelmonkey/.rbenv/shims:/home/pixelmonkey/.rbenv/bin:/home/pixelmonkey/opt/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

export EDITOR='vim'
