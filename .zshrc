export ZSH=$HOME/.oh-my-zsh

# for tmux
export DISABLE_AUTO_TITLE=true

ZSH_THEME="ampy"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git
         github
         python
         hop
         tmux
         vagrant
         fabric
         docker
         lein
         npm
         history-substring-search
         per-directory-history
         zsh-better-npm-completion
         sudo)

path=(
    /opt/spark/bin
    /opt/storm/bin
    /opt/vagrant/bin
    /home/am/.rbenv/bin
    /home/am/.pyenv/bin
    /home/am/.nvm/bin
    /home/am/opt/bin
    /home/am/gopath/bin
    /home/am/.cargo/bin
    /usr/lib/lightdm/lightdm
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

source $ZSH/oh-my-zsh.sh

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

# add gvm support
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# add travis CLI support
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# cogtree customizations
[ -f $HOME/.cogtree ] && source $HOME/.cogtree

# vim and tmux
export EDITOR='vim'
export TERM='xterm-256color'
[ -n "$TMUX" ] && export TERM='screen-256color'
source ~/.tmuxp/.tmuxp.zsh

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

# much bigger shell history
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history
# this option works better with tmux
setopt nosharehistory

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/opt/google-cloud-sdk/path.zsh.inc'; fi
#
# # The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi

# speed up git completion
__git_files () {
    _wanted files expl 'local files' _files
}

# sdkman - java
export SDKMAN_DIR="/home/am/.sdkman"
[[ -s "/home/am/.sdkman/bin/sdkman-init.sh" ]] && source "/home/am/.sdkman/bin/sdkman-init.sh"

# make Java scripts work
export JAVA_HOME="/home/am/.sdkman/candidates/java/11.0.2-open/"
export JAVA9_HOME="/home/am/.sdkman/candidates/java/9.0.4-open"
