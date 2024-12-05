GO_OUT_DIR=./gen/go
PROTO_FILES=$(wildcard proto/**/*.proto)

.PHONY: gen-go
gen-go:
	echo $(PROTO_FILES)
	docker run --rm -v ./:/workdir -w /workdir rvolosatovs/protoc \
 		--proto_path proto $(PROTO_FILES) \
		--go_out=$(GO_OUT_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(GO_OUT_DIR) \
		--go-grpc_opt=paths=source_relative \
		 $(PROTO_FILES)
