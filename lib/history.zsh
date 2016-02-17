## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS # ignore duplication command history list
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY # share command history data
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
