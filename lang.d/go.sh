export GOPATH="$HOME/code/go"
export PATH=$PATH:$GOPATH/bin

if [[ -d /usr/local/go/bin ]]; then
    export PATH="/usr/local/go/bin:$PATH"
fi
