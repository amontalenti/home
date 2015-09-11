export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ampy"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git
         github
         python
         hop
         tmux
         vagrant
         fabric
         lein
         npm
         history-substring-search
         per-directory-history
         sudo)

path=(
    /opt/spark/bin
    /opt/storm/bin
    /opt/vagrant/bin
    /home/am/.rbenv/bin
    /home/am/.pyenv/bin
    /home/am/.nvm/bin
    /home/am/opt/bin
    /usr/lib/lightdm/lightdm
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

source $ZSH/oh-my-zsh.sh

# Java should point to Oracle JVM
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/"

# use drip to make lein runs faster
#export LEIN_JAVA_CMD="$HOME/opt/bin/drip"
# ^^^ this isn't fool-proof, so disabling for now
# since it actually broke streamparse runs

# add rbenv support
eval "$(rbenv init -)"

# add pyenv support
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1

# add nvm support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

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
