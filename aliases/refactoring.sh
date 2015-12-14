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