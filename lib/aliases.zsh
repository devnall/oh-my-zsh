# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Super user
alias _='sudo'

alias gr='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias lsa='ls -lahF'
alias lsal='ls -lahF|less'
alias l='ls -lah'
alias ll='ls -l'
alias la='ls -lAh'

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

# No "free" command on OSX, here's a hacky substitute
if [[ `uname` == 'Darwin' ]]; then
  alias free="top -l 1 -s 0 | grep PhysMem"
fi
