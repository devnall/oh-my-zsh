function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

function dusk() {
  du -sk "$@" | sort -n | while read size fname 
    do for unit in k M G T P E Z Y
      do if [ $size -lt 1024 ]
        then echo -e "${size}${unit}\t${fname}"
        break
      fi
    size=$((size/1024))
    done
  done
}

function duck() {
  du -ck "$@" | sort -n | while read size fname 
    do for unit in k M G T P E Z Y
      do if [ $size -lt 1024 ]
        then echo -e "${size}${unit}\t${fname}"
        break
      fi
    size=$((size/1024))
    done
  done
}
