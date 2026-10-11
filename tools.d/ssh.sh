if [ "$(uname -s)" = "Linux" ]; then
    CANON="$HOME/.authsock"
    # SSH login with a forwarded agent: claim CANON only if it isn't already a
    # live socket, so a short-lived session can't leave it dangling.
    if [ -n "$SSH_CONNECTION" ] && [ -S "$SSH_AUTH_SOCK" ] && [ "$SSH_AUTH_SOCK" != "$CANON" ] && ! [ -S "$CANON" ]; then
      ln -snf "$SSH_AUTH_SOCK" "$CANON"
    fi
    export SSH_AUTH_SOCK=$CANON
fi
