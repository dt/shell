export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TZ=UTC

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export GOPATH="$HOME/code/go"

export WORKON_HOME=~/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME

if [[ "$(uname)" == "Darwin" ]]; then
    export EDITOR="subl -w"
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_40)
    if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
    fi
fi

# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

    # ignore successive dupes and leading whitespace lines for history
    export HISTCONTROL=ignoreboth
    export HISTSIZE=10000000
    if [[ -d ~/Dropbox ]]; then
        cp -f ~/.bash_history ~/Dropbox/.bash_history-$(hostname -s)
    fi
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
    PS1="$(stty sane)$(history -a)$PS1"

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

if [[ -n "$SSH_AUTH_SOCK" ]]; then
    ln -sf $SSH_AUTH_SOCK ~/.authsock
    export SSH_AUTH_SOCK=~/.authsock
fi
