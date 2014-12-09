## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="--quit-if-one-screen --hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --hilite-unread --no-init --window=-4"

export LC_CTYPE=$LANG
