# place this after nvm initialization!
autoload -U add-zsh-hook

export NVM_DEFAULT=1
export NVM_PROJECT=/foo/bar/baz

load-nvmrc() {
  # skip nvm-auto-cd logic if not in ~/repos (activate) or $HOME (deactivate)
  if [[ ! $PWD =~ "repos/" && ! $PWD = $HOME ]]; then
    return;
  fi

  if [[ $PWD = $HOME ]]; then
      # skip nvm-auto-cd logic in $HOME if we're already on default node
      if [[ $NVM_DEFAULT = 1 ]]; then
          return;
      fi
  fi

  if [[ $PWD =~ $NVM_PROJECT ]]; then
      return;
  fi


  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_found=$(cat "${nvmrc_path}")
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      # can't find the .nvmrc alias or version in our current installed envs
      echo "Couldn't activate <${nvmrc_found}> via nvm-auto-cd; use 'nvm install' and 'nvm alias' to resolve"
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # found .nvmrc and it doesn't match the current version, so we need to activate it
      # echo "Found <${nvmrc_found}> via nvm-auto-cd, activating now"
      nvm use --silent
      export NVM_DEFAULT=0
      export NVM_PROJECT=$(dirname $nvmrc_path)
    else
      # cd'ing around within a project where nothing is changing
      # echo "Found <${nvmrc_found}> via nvm-auto-cd, same as current node version"
    fi
  else
    # no .nvmrc in current path, e.g. $HOME
    #echo "Reverting to <default> Node version via nvm-auto-cd"
    nvm use default --silent
    export NVM_DEFAULT=1
    export NVM_PROJECT=/foo/bar/baz
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
