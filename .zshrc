fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# rbenv
# eval "$(rbenv init -)"

if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi