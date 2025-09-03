case "$(uname -s)" in
  Linux)
    CANON="$HOME/.authsock"

    if [ -n "$SSH_CONNECTION" ] && [ -n "$SSH_AUTH_SOCK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
      # SSH login with a forwarded agent -> normalize to ~/.authsock
      ln -snf "$SSH_AUTH_SOCK" "$CANON"
      export SSH_AUTH_SOCK="$CANON"
    else
      # Not an SSH session (e.g., RDP/console) -> only use a live local agent if present
      if [ -S "$CANON" ] && ssh-add -l >/dev/null 2>&1; then
        export SSH_AUTH_SOCK="$CANON"
      else
        unset SSH_AUTH_SOCK
      fi
    fi
    ;;
esac