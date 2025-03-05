GOBIN := $(CURDIR)/bin

install-deps:
	@set GOBIN=$(GOBIN) && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@set GOBIN=$(GOBIN) && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

get-deps:
	go get -u google.golang.org/protobuf/cmd/protoc-gen-go
	go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc

generate:
	@if not exist "pkg\note_v1" mkdir pkg\note_v1
	protoc -I=api/note_v1 --go_out=pkg\note_v1 --go_opt=paths=source_relative --go-grpc_out=pkg\note_v1 --go-grpc_opt=paths=source_relative note.proto 