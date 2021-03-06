# devnall.zsh-theme
#
# Author: Drew Nall
# URL:
# Repo:
# Direct Link:
#
# Created on:	March 23, 2013
# Last modified on:	February 18, 2016

# Make git info available to prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' use-simple true
zstyle ':vcs_info:git*' max-exports 2
zstyle ':vcs_info:git*' formats ' %b' 'x%R'
zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'

autoload colors && colors

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# Functions to build git-aware prompt(s)
git_check() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  if [[ $? -eq 1 ]]; then
    exit 0
  else
    echo "%F{39}%f"
  fi
}

git_dirty() {
  # check to see if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  # check to see if it's dirty
  command git diff --quiet --ignore-submodules HEAD &>/dev/null;
  if [[ $? -eq 1 ]]; then
#    echo "%F{red}✗%f"
    echo "%F${my_orange}±%f"
  else
    echo "%F{green}✔%f"
  fi
}

# Get the status of the current branch and its remote
# If there are changes upstream, display a ⇣
# If there are changes that have been committed but not yet pushed, display a ⇡
git_arrows() {
  # do nothing if there is no upstream configured
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local arrows=""
  local status
  arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"

  # do nothing if the command failed
  (( !$? )) || return

  # split on tabs
  arrow_status=(${(ps:\t:)arrow_status})
  local left=${arrow_status[1]} right=${arrow_status[2]}

  (( ${right:-0} > 0 )) && arrows+="%F{red}⬇%f"
#  (( ${left:-0} > 0 )) && arrows+="%F{046}⇡%f"
  (( ${left:-0} > 0 )) && arrows+="%F${my_orange}⬆%f"
#  (( ${left:-0} > 0 )) && arrows+="%F{208}⇡%f"

  echo $arrows
}

# If there is a job in the background, display a ✱
suspended_jobs() {
  local sj
  sj=$(jobs 2>/dev/null | tail -n 1)
  if [[ $sj == "" ]]; then
    echo ""
  else
    echo "%{$FG[208]%}✱%f"
  fi
}

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [ "${whoami}" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="blue"
fi


precmd() {
  vcs_info
#  print -P '\n`git_check`%F{39}%~ `git_dirty`%F{246}$vcs_info_msg_0_%f `git_arrows` `suspended_jobs`'
  print -P '\n`git_check``git_arrows` %F{39}%~  %F{246}$vcs_info_msg_0_%f `git_dirty`'
}

export PROMPT='`suspended_jobs`%(?.%F{10}.%F{10})❯%f '
#export RPROMPT='`git_dirty`%F{246}$vcs_info_msg_0_%f `git_arrows` `suspended_jobs`'
export RPROMPT=''
