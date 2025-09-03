if [ "$(uname -s)" = "Linux" ]; then
    CANON="$HOME/.authsock"
    if [ -n "$SSH_CONNECTION" ] && [ -n "$SSH_AUTH_SOCK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
      # SSH login with a forwarded agent: update CANON to point to it.
      ln -snf "$SSH_AUTH_SOCK" "$CANON"
    fi
    export SSH_AUTH_SOCK=$CANON
fi