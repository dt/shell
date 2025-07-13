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
  cd ~/code/cockroach/branches/$1/
}

function cla() {
  curl -H "Authorization: token $(git config --get cockroach.githubtoken)" \
    -d '{"state": "success", "context":"license/cla", "description": "curl"}' \
    https://api.github.com/repos/cockroachdb/cockroach/statuses/$1
}

function roachdns() {
  roachprod adminurl $1 --ips --insecure=false |
    awk '{printf "%04d\t%s\n", NR, $0}' | # prepend the padded node IDs.
    sed -e 's,https://\(.*\):26258/,\1,g' | # remove the HTTPS part.
    while read node ip; do
      host="${1}-${node}.roachprod.crdb.io."
      gcloud dns --project=cockroach-shared record-sets ${2:-update} "${host}" --rrdatas="${ip}" \
        --type="A" --zone="roachprod" --ttl=60
    done
}

alias ghapi='curl -s -H "Authorization: token $(git config --get cockroach.githubtoken)"'

export COCKROACH_ROACHPROD_INSECURE=1