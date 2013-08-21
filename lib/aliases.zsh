# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Super user
alias _='sudo'

alias gr='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lahF'
alias lsal='ls -lahF|less'
alias l='ls -lA1'
alias ll='ls -l'
alias la='ls -lA'

alias rm='rm -i'
alias du='du -h'

# Use the keyboard shortcut, dummy
alias cl='echo "No! Use CTRL+L!"'
alias clear='echo "No! Use CTRL+L!"'

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
