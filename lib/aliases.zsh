# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# Super user
alias _='sudo'

alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lahF'
alias l='ls -lA1'
alias ll='ls -l'
alias la='ls -lA'

alias rm='rm -i'
alias du='du -h'
alias cl='clear'

alias cp='cp -i'
alias mv='mv -i'

alias tf='tail -f'

alias ssr='ssh -l root'

alias gvim='/usr/local/bin/mvim'

alias afind='ack-grep -il'

if [[ `which cdf` == '/usr/local/bin/cdf' ]]; then
  alias df='cdf -h'
else
  alias df='df -h'
fi
