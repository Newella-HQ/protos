GO_OUT_DIR=./gen/go

PROTO_FILES=$(wildcard proto/**/*.proto)

.PHONY: gen-go
gen-go: $(PROTO_FILES)
	mkdir -p $(GO_OUT_DIR)
	protoc -I proto $(PROTO_FILES) \
		--go_out=$(GO_OUT_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(GO_OUT_DIR) \
		--go-grpc_opt=paths=source_relative