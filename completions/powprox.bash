_powprox() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(powprox commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(powprox completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _powprox powprox
