if [[ "$ENABLE_CORRECTION" == "true" ]]; then
  alias gist='nocorrect gist'
  alias man='nocorrect man'
  alias mkdir='nocorrect mkdir'
  alias mv='nocorrect mv'
  alias mysql='nocorrect mysql'
  alias sudo='nocorrect sudo'

  setopt correct_all
fi
