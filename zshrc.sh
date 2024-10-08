# Check for updates to the shell scripts
if [[ -d ~/.shell/.git ]]; then
   (( cd ~/.shell && git pull && ./setup.sh ) > /dev/null 2>/dev/null >/dev/null) || echo "cannot update ~/.shell automatically"
fi

if [[ "$(uname)" == "Darwin" ]]; then
  # Path to your oh-my-zsh installation.
  export ZSH="/Users/david/.oh-my-zsh"
  export EDITOR="code -w"
fi

ZSH_THEME="robbyrussell"
plugins=(history-substring-search zsh-completions)
source $ZSH/oh-my-zsh.sh



# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

HISTFILE=~/.zsh_history

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

unsetopt share_history
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

if [ -f ~/.shell/aliases.sh ]; then
    source ~/.shell/aliases.sh
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit

# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

for i in ~/.shell/tools.d/*; do
  source $i
done

# oh-my-zsh runs less command with -R (repaint).
# You can disable this behavior by adding the following line at the end of your ~/.zshrc
unset LESS;