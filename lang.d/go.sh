export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

if [[ -d ~/goroot/bin ]]; then
    export PATH=~/goroot/bin:$PATH
elif [[ -d /usr/local/opt/go/libexec ]]; then
	export GOROOT="/usr/local/opt/go/libexec"
    export PATH="/usr/local/opt/go/libexec/bin:$PATH"
elif [[ -d /usr/local/go/bin ]]; then
	export GOROOT="/usr/local/go"
    export PATH="/usr/local/go/bin:$PATH"
fi
