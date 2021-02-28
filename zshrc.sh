# Check for updates to the shell scripts
if [[ -d ~/.shell/.git ]]; then
   (( cd ~/.shell && git pull && ./setup.sh ) > /dev/null 2&>1) || echo "cannot update ~/.shell automatically"
fi

if [[ "$(uname)" == "Darwin" ]]; then
  # Path to your oh-my-zsh installation.
  export ZSH="/Users/david/.oh-my-zsh"
  ZSH_THEME="robbyrussell"
  plugins=(history-substring-search)
  source $ZSH/oh-my-zsh.sh

  export EDITOR="code -w"
fi


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

autoload -Uz compinit && compinit
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

if [ -f ~/.shell/aliases.sh ]; then
    . ~/.shell/aliases.sh
fi

