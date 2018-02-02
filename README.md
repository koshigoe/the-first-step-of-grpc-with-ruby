Ruby で学ぶ gRPC はじめの一歩
====


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

### コンソールから実行

```
$ bin/console
```

認証。

```
> auth = Study20180216::Authenticator::Stub.new('localhost:50052', :this_channel_is_insecure)
> credentials = Study20180216::Credentials.new(
    password: Study20180216::PasswordCredentials.new(
      password: Study20180216::Password.new(
        id: 'user',
        raw_password: 'pass',
      )
    )
  )
> auth.authenticate(Study20180216::AuthRequest.new(credentials: credentials))
```

ページ作成。

```
> note = Study20180216::Notebook::Stub.new('localhost:50051', :this_channel_is_insecure)
> page_request = Study20180216::PageRequest.new(
    credentials: credentials,
    page: Study20180216::Page.new(title: 'TITLE 2018/02/13', content: 'CONTENT 2018/02/13')
  )
> note.create_page(page_request)
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
