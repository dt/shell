export GOPATH="$HOME/code/go"
export PATH=$PATH:$GOPATH/bin

if [[ -d ~/go/bin ]]; then
    export PATH=~/go/bin:$PATH
elif [[ -d /usr/local/go/bin ]]; then
	export GOROOT="/usr/local/go"
    export PATH="/usr/local/go/bin:$PATH"
fi
