# Reload zsh config
alias reload!='source ~/.zshrc'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Super user
alias _='sudo'

alias gr='grep -in --color'

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

# Determine flavor of `ls`
# TODO: Break the lsal stuff into its own function
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
  alias lsal='ls -lahF ${colorflag} | less -R'
else # OSX `ls`
  colorflag="-G"
  alias lsal='CLICOLOR_FORCE=1 ls -lahF ${colorflag} | less -R'
fi

alias l='ls -lAhF ${colorflag}'
alias ll='ls -lhF ${colorflag}'
alias la='ls -AhF ${colorflag}'
alias lsa='ls -lahF ${colorflag}'
#alias lsal='ls -lahF ${colorflag} | less -R'

alias rm='rm -i'
alias du='du -h'
alias cp='cp -i'
alias mv='mv -i'

# Use the keyboard shortcut, dummy
alias cl='echo "No! Use CTRL+L!"'
alias clear='echo "No! Use CTRL+L!"'

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

# Grab IP addresses
alias ip='echo "External IP:   " `dig +short myip.opendns.com @resolver1.opendns.com` && echo "Ethernet (en3):" `ipconfig getifaddr en3` && echo "Wireless (en0):" `ipconfig getifaddr en0`'
# TODO: Turn this into a function that can handle different OSes
alias localip='echo "Ethernet (en0):" `ipconfig getifaddr en0` && echo "Wireless (en1):" `ipconfig getifaddr en1`'
alias ips='ifconfig -a | perl -nle"/(\d+\.\d+\.\d+\.\d+)/ && print $1"'

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias dscleanup="find . -name '*.DS_Store' -type f -ls -delete"

# ROT13 encode/decode text
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
