export GOPATH="$HOME/code/go"
export PATH=$PATH:$GOPATH/bin

if [[ -d /data/loko/infrastructure-go/current/ ]]; then
    export GOROOT=/data/loko/infrastructure-go/current/
    export PATH="$GOROOT/bin:$PATH"
fi

gr () {
  cd $GOPATH/src/github.com/*/$1
}
