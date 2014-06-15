export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ampy"

export TERM='xterm-256color'

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

path=(
    /opt/storm/bin/
    /opt/vagrant/bin/
    /home/pixelmonkey/.rbenv/shims
    /home/pixelmonkey/.rbenv/bin
    /home/pixelmonkey/opt/bin
    /usr/lib/lightdm/lightdm
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

export EDITOR='vim'

# remember recent working directories. See zshcontrib(1).
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
