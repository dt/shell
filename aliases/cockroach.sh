alias csql='psql postgresql://root@localhost:26257?sslmode=disable'

if [[ -d "${GOPATH}/src/github.com/cockroachlabs/production/crl-prod" ]]; then
  export PATH=${PATH}:${GOPATH}/src/github.com/cockroachlabs/production/crl-prod
fi

if [ -f ~/.roachprod/bash-completion.sh ]; then
  . ~/.roachprod/bash-completion.sh
fi

if [ -f ~/.cockroach.lic ]; then
  export COCKROACH_DEV_LICENSE="$(cat ~/.cockroach.lic)"
fi


function cla() {
  curl -H "Authorization: token $(git config --get cockroach.githubtoken)" \
    -d '{"state": "success", "context":"license/cla", "description": "curl"}' \
    https://api.github.com/repos/cockroachdb/cockroach/statuses/$1
}