alias csql='psql postgresql://root@localhost:26257?sslmode=disable'

if [[ -d "${GOPATH}/src/github.com/cockroachlabs/production/crl-prod" ]]; then
  export PATH=${PATH}:${GOPATH}/src/github.com/cockroachlabs/production/crl-prod
fi