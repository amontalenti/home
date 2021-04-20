# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

# revert to "ampy" here if powerlevel10k is giving issues
ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
         github
         python
         tmux
         fabric
         docker
         lein
         npm
         nvm
         nvm-auto-cd
         history-substring-search
         per-directory-history
         zsh-better-npm-completion
         sudo)

path=(
    /opt/spark/bin
    /opt/storm/bin
    /opt/vagrant/bin
    /home/am/.local/bin
    /home/am/.pyenv/bin
    /home/am/.nvm/bin
    /snap/bin
    /home/am/opt/bin
    /home/am/gopath/bin
    /home/am/.cargo/bin
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

# TODO: ^^^ should /opt/{storm,spark,vagrant} still be there?

# for tmux
export DISABLE_AUTO_TITLE=true

source $ZSH/oh-my-zsh.sh

# enable emacs-style line editing
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# add pyenv support
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# intentionally disabled:
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# ansible can't respect ~/.ssh/config when using raw IPs
export ANSIBLE_REMOTE_USER=pixelmonkey

# add nvm (NodeJS Version Manager) support
# intentionally disabled:
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
# TODO: ^^^ should remove, since replaced by nvm, nvm-auto-cd plugins

# add gvm (Go Version Manager) support
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# sdkman - java installer and version manager
export SDKMAN_DIR="/home/am/.sdkman"
[[ -s "/home/am/.sdkman/bin/sdkman-init.sh" ]] && source "/home/am/.sdkman/bin/sdkman-init.sh"

# this makes stubborn Java scripts work
export JAVA_HOME="/home/am/.sdkman/candidates/java/11.0.2-open/"
export JAVA9_HOME="/home/am/.sdkman/candidates/java/9.0.4-open"

# add travis CLI support
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
# TODO: ^^^ unnecessary, remove

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

# The next line enables shell command completion for gcloud.
if [ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/share/google-cloud-sdk/completion.zsh.inc'; fi

# speed up git completion
__git_files () {
    _wanted files expl 'local files' _files
}

# broot
source /home/am/.config/broot/launcher/bash/br

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
