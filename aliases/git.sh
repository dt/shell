
alias g="git"

# IF git-completion is defined, define it for "g" shortcut too.
declare -f -F __git_complete > /dev/null && __git_complete g __git_main

alias gb="git branch --color -v --list -v"
alias gg="git grep"
alias gp="git pull --rebase"
alias gm="git commit -a -m"
alias gs="git status"
alias s="git status"
alias recommit="git commit --amend --no-edit"
alias gd="git diff"
alias gf="git push -f"

if hash hub 2>/dev/null; then
	alias git=hub
fi
