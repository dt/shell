alias csql='psql postgresql://root@localhost:26257?sslmode=disable'

if [[ -d "${GOPATH}/src/github.com/cockroachlabs/production/crl-prod" ]]; then
  export PATH=${PATH}:${GOPATH}/src/github.com/cockroachlabs/production/crl-prod
fi
if [[ -d "${GOPATH}/src/github.com/cockroachdb/cockroach/bin" ]]; then
  export PATH=${PATH}:${GOPATH}/src/github.com/cockroachdb/cockroach/bin
fi

if [ -f ~/.cockroach.lic ]; then
  export COCKROACH_DEV_LICENSE="$(cat ~/.cockroach.lic)"
fi

function brch() {
  cd ~/code/cockroach/branches/$1/src/github.com/cockroachdb/cockroach
  export GOPATH=~/code/cockroach/branches/$1
}

function cla() {
  curl -H "Authorization: token $(git config --get cockroach.githubtoken)" \
    -d '{"state": "success", "context":"license/cla", "description": "curl"}' \
    https://api.github.com/repos/cockroachdb/cockroach/statuses/$1
}

alias ghapi='curl -s -H "Authorization: token $(git config --get cockroach.githubtoken)"'

export COCKROACH_ROACHPROD_INSECURE=1