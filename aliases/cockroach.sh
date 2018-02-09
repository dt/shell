alias csql='psql postgresql://root@localhost:26257?sslmode=disable'

if [[ -d "${GOPATH}/src/github.com/cockroachlabs/production/crl-prod" ]]; then
  export PATH=${PATH}:${GOPATH}/src/github.com/cockroachlabs/production/crl-prod
fi

if [ -f ~/.roachprod/bash-completion.sh ]; then
  # The completion func is re-generated on sync to include current clusters.
  # This is a wrapper func that:
  #   a) re-reads he original file to re-define the real func
  #   b) overrides the registration back to our wrapper (the file registers it as well as defining it).
  #   c) call the original func
  __reload_start_roachprod()
  {
    . ~/.roachprod/bash-completion.sh
    if [[ $(type -t compopt) = "builtin" ]]; then
        complete -o default -F __reload_start_roachprod roachprod
    else
        complete -o default -o nospace -F __reload_start_roachprod roachprod
    fi
    __start_roachprod
  }

  if [[ $(type -t compopt) = "builtin" ]]; then
      complete -o default -F __reload_start_roachprod roachprod
  else
      complete -o default -o nospace -F __reload_start_roachprod roachprod
  fi

fi
