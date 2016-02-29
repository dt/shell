export GOPATH="$HOME/code/go"
export PATH=$PATH:$GOPATH/bin

if [[ -d ~/go/bin ]]; then
    export PATH=~/go/bin:$PATH
elif [[ -d /usr/local/go/bin ]]; then
    export PATH="/usr/local/go/bin:$PATH"
fi
