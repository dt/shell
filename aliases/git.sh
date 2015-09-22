
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
