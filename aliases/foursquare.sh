alias mt='dependencies/mongodb/bin/mongod --maxConns 1500 --dbpath=mongo-testdb/'
alias oiddate="python -c \"import struct;import sys;import datetime;print(datetime.datetime.fromtimestamp(struct.unpack('>i', sys.argv[1].decode('hex')[0:4])[0]))\""

function fr() {
  all="`git grep "$1"`"
  files="`echo "$all" | cut -f1 -d: | sort | uniq`"
  total=`echo "$all" | wc -l | tr -d ' ' `
  count=`echo "$files" | wc -l | tr -d ' ' `

  if [[ -z "$all" ]]; then
    echo "None found."
  else
    echo "Replacing $total occurances of"
    echo ">  $1"
    echo "with"
    echo ">  $2"
    echo "in $count files..."
    #echo perl -pi -e "s@$1@$2@g" $files
    perl -pi -e "s@$1$3@$2@g" $files
  fi
}

function re() {
  echo "com.foursquare.$1 -> com.foursquare.$2"
  python src/python/foursquare/source_code_analysis/scala_import_rewriter.py --rewrite_from "com.foursquare.$1" --rewrite_to "com.foursquare.$2" src/jvm test/jvm verification/src
}

alias f='cd ~/code/fs'
alias fp='git fpull'
alias gf="git fpush origin master"
alias work='cd ~/code/fs/1'
alias f1='cd ~/code/fs/1 && subl ~/.sublime/fs1.sublime-project'
alias f2='cd ~/code/fs/2 && subl ~/.sublime/fs2.sublime-project'

alias dev="ssh dev-davidt"
alias repl='ssh -t dev-davidt screen -D -R -S repl "repl-me ads-api --prod"'

function deploy() {
  ssh -t dev-davidt "cd code/foursquare.web && git pull && ./build-support/service_releaser --env prod --skip-aurora-prompts $*"
}

function pkg() {
  ./python src/python/foursquare/source_code_analysis/scala_import_rewriter.py --nobackup --rewrite_from $1 --rewrite_to $2 lib/fscommon

  ./python src/python/foursquare/source_code_analysis/scala_import_rewriter.py --nobackup --rewrite_from $1 --rewrite_to $2 src/jvm/com/foursquare

  ./python src/python/foursquare/source_code_analysis/scala_import_rewriter.py --nobackup --rewrite_from $1 --rewrite_to $2 test/jvm/com/foursquare
}

function renamespace() {
  if [ $# -le 2 ]; then
    echo "usage: renamespace FROM_PKG TO_PKG SYMBOL*"
  else
    from=$1
    shift
    to=$1
    shift
    for i in $*; do
      echo "$from.$i -> $to.$i"
      pkg $from.$i $to.$i
    done
  fi
}
