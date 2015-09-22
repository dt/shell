alias rebash="source ~/.bashrc"
alias r=reset

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

############
# Aliases
alias cp="cp -i"
alias mv="mv -i"
alias du="du -h"
alias df="df -h"
alias vi="vim"

pretty () {
  python -c "import json; import sys; obj = json.loads(sys.stdin.read()); print json.dumps(obj['$1'] if '$1' else obj, sort_keys = True, indent = 2)"
}

alias ..='cd ..';
alias cd..='cd ..';
alias cd.='cd ..';
alias cd,,="cd ..";
alias ks="echo 'missed the L key, dumbass' && ls "

alias kj="killall -9 java"

fixssh () {
  (
    SSHPID=`ps -u davidt | grep sshd | cut -d" " -f1 | head -n1`
    if [[ "$SSHPID" != "" ]]; then
      NEWSOCK=`find /tmp -name *agent.$SSHPID 2>/dev/null`
    else
      echo "Could not find an SSH proc."
      exit 1
    fi
    if [[ "$NEWSOCK" != "" ]]; then
      echo "~/.authsock -> $NEWSOCK"
      ln -sf "$NEWSOCK" ~/.authsock
    else
      echo "Could not find auth sock for ssd $SSHPID"
    fi
  )
}

for i in ~/.shell/aliases/*; do
  source $i
done

