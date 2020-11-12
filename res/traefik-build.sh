# Clone repo
git clone https://github.com/traefik/traefik.git ~/go/src/github.com/traefik/traefik

# go env
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# build
GO111MODULE=on

cd ~/go/src/github.com/traefik/traefik

# Get go-bindata. (Important: the ellipses are required.)
GO111MODULE=off go get github.com/containous/go-bindata/...

# Generate UI static files
rm -rf static/ autogen/; make generate-webui

# required to merge non-code components into the final binary,
# such as the web dashboard/UI
go generate

# Standard go build
go build ./cmd/traefik

# Tests
go test ./...

# Integration tests
$ cd integration && go test -integration ./...
