The first steop of gRPC with Ruby
====

Ruby で学ぶ gRPC はじめの一歩。


Setup
----

```
$ bundle install
```

### .proto ファイルからドキュメント生成する場合

```
$ brew install protobuf
$ go get -u github.com/pseudomuto/protoc-gen-doc/cmd/...
```


DEMO
----

### 認証 gRPC サーバを起動

```
$ bin/cli server authenticator --port 50052
```

### ノート gRPC サーバを起動

```
$ bin/cli server notebook --port 50051
```

### フロントサーバを起動

```
$ bin/notebook_front_server
```

```
$ open http://localhost:4567
```


Other
----

### protobuf コンパイル

```
$ bundle exec grpc_tools_ruby_protoc -I./protobuf --ruby_out=lib --grpc_out=lib protobuf/*
```

### protobuf ドキュメント生成

```
$ protoc -I./protobuf --doc_out=./ --doc_opt=markdown,rpc.md protobuf/*.proto
```
