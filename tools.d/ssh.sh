if [[ -n "$PS1" ]] ; then
    if [[ -n "$SSH_TTY" ]]; then
        if [[ -n "$SSH_AUTH_SOCK" && "$SSH_AUTH_SOCK" != ~/.authsock ]]; then
            ln -sf $SSH_AUTH_SOCK ~/.authsock
            export SSH_AUTH_SOCK=~/.authsock
        fi
    fi
fi