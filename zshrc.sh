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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000000
SAVEHIST=1000000000

unsetopt share_history
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.


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