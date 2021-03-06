export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TZ=UTC

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [[ -d /opt/homebrew/bin ]]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

export PATH=~/bin:$PATH

for i in ~/.shell/lang.d/*; do
  source $i
done

for i in ~/.shell/tools.d/*; do
  source $i
done

if [[ "$(uname)" == "Darwin" ]]; then
    export EDITOR="code -w"
    if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
    fi
fi

# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then
    # Check for updates to the shell scripts
    if [[ -d ~/.shell/.git ]]; then
      ( (cd ~/.shell && git pull 2> /dev/null > /dev/null && ./setup.sh) & > /dev/null )
    fi

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

    # ignore successive dupes and leading whitespace lines for history
    export HISTCONTROL=ignoreboth:erasedupes
    export HISTSIZE=10000000
    shopt -s histappend

    nocolor="\[\033[00m\]"
    boldblue="\[\033[01;34m\]"
    boldgreen="\[\033[01;32m\]"
    boldyellow="\[\033[01;33m\]"

    PS1HOSTNAME=""
    PSCOLOR="${boldgreen}"
    # If this is a remote shell, make it yellow and include hostname.
    if [[ -n "$SSH_TTY" ]]; then
        PSCOLOR="${boldyellow}"
        PS1HOSTNAME=" $(hostname -s)"
        PS1HOSTNAME="${PS1HOSTNAME/ezem7/bodega}"
        PS1HOSTNAME="${PS1HOSTNAME/ezeq27/dev-dt}"
    fi

    PS1="${PSCOLOR}[\$(date +%H:%M:%S)]${PS1HOSTNAME} ${boldblue}\w${nocolor} \$ "
    PS1="\n\$(stty sane)\$(history -a)$PS1"

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
        xterm*|rxvt*)
            PROMPT_COMMAND='echo -ne "\033]0;${PS1HOSTNAME} $(basename ${PWD/$HOME/~})\007"'
            ;;
        *)
            PROMPT_COMMAND=""
            ;;
    esac

    unset color_prompt nocolor boldblue boldgreen PSCOLOR
    export PROMPT_COMMAND

    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    if [ -f ~/.shell/aliases.sh ]; then
        . ~/.shell/aliases.sh
    fi
fi
