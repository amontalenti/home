# Completion for which-origin: complete command names in PATH
_which_origin_complete() {
  local cur
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -c -- "$cur") )
}

# -o default keeps normal filename completion as a fallback
complete -o default -F _which_origin_complete which-origin
