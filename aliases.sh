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

alias g="git"

# IF git-completion is defined, define it for "g" shortcut too.
declare -f -F __git_complete > /dev/null && __git_complete g __git_main

alias gb="git branch --color -v --list"
alias gg="git grep"
alias gp="git pull --rebase"
alias gm="git commit -a -m"
alias gs="git status"
alias s="git status"
alias recommit="git commit --amend --no-edit"

alias kj="killall -9 java"


for i in ~/.shell/aliases/*; do
  source $i
done

