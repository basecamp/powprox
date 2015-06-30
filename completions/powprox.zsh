if [[ ! -o interactive ]]; then
    return
fi

compctl -K _powprox powprox

_powprox() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(powprox commands)"
  else
    completions="$(powprox completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
