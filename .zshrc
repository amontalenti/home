export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ampy"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git github
         python virtualenv virtualenvwrapper
         hop
         tmux
         vagrant
         fabric
         lein
         npm
         sudo)

source $ZSH/oh-my-zsh.sh

#add: /opt/miniconda/bin/ for miniconda
#
path=(
    /opt/spark/bin
    /opt/storm/bin
    /opt/vagrant/bin
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

# Java should point to Oracle JVM
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/"

# add rbenv support
eval "$(rbenv init -)"

# add travis CLI support
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# vim and tmux
export EDITOR='vim'
export TERM='xterm-256color'
[ -n "$TMUX" ] && export TERM='screen-256color'

# remember recent working directories. See zshcontrib(1).
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# allow `ssh` to autocomplete hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# ignore '.pyc' files during completion
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"

# but not for `rm` or `find`
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns
zstyle ':completion:*:find:*:(all-|)files' ignored-patterns

setopt BRACE_CCL

# bash compatibility
source $HOME/.bash_aliases
source $HOME/.bash_functions
