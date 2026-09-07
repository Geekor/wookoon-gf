# Makefile 放在 wookoon‑gf 项目根目录
PROTO_SRC_DIR := manifest/protobuf
PROTOC        := /usr/bin/protoc

# 查找所有proto文件
PROTO_FILES := $(shell find $(PROTO_SRC_DIR) -name "*.proto")

.PHONY: pb clean

pb:
	@echo "Compiling proto files: $(PROTO_FILES)"
	$(PROTOC) \
		--proto_path=$(PROTO_SRC_DIR) \
		--go_out=. \
		--go-grpc_out=. \
		$(PROTO_FILES)

clean:
	# 根据 go_package 生成的 go 文件，匹配 proto 同目录下生成的 *.pb.go *.pb.gw.go *_grpc.pb.go
	#find . -name "*.pb.go" -delete
	#find . -name "*_grpc.pb.go" -delete
	rm -rf ./api/
