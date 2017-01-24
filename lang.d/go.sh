export GOPATH="$HOME/code/go"
if [ -f "$HOME/.gce" ]; then
	export GOPATH="$HOME/code/gce"
fi
export PATH=$PATH:$GOPATH/bin

if [[ -d ~/goroot/bin ]]; then
    export PATH=~/goroot/bin:$PATH
elif [[ -d /usr/local/go/bin ]]; then
	export GOROOT="/usr/local/go"
    export PATH="/usr/local/go/bin:$PATH"
fi
