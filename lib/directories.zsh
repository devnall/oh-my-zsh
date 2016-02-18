# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='../../../../..'
alias -- -='cd -'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
