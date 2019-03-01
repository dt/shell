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

function workon() {
  g co $1
  echo '
  tell application "Visual Studio Code" to activate
  tell application "System Events"
	  keystroke "k" using command down
	  keystroke "w" using command down
  end tell
  ' | osascript
  # would be nice to tell vscode to run `View: Close All Editors` here?
  code $(g diff --name-only $(g merge-base HEAD upstream/master)..HEAD)
}

pretty () {
  python -c "import json; import sys; obj = json.loads(sys.stdin.read()); print json.dumps(obj['$1'] if '$1' else obj, sort_keys = True, indent = 2)"
}