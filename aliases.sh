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

alias ..='cd ..'
alias cd..='cd ..'
alias cd.='cd ..'
alias cd,,="cd .."

for i in ~/.shell/aliases/*; do
  source $i
done

