alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias sudo='nocorrect sudo'

if [[ "$ENABLE_CORRECTION" == "true" ]]; then
  setopt correct_all
fi
