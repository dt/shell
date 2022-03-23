# this jumps into the first matching go project
# assumes some a
gr () {
  cd $GOPATH/src/*/*/$1*
}


function bstat() {
  benchstat <(grep "$2" $1 | sed "s@$2@@") <(grep "$3" $1 | sed "s@$3@@")
}