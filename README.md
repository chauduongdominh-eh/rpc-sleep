# gRPC example

The server has a single function that waits for a specific duration before
return.

Regenerate the code with:

```sh
grpc_tools_ruby_protoc -I ./protos --ruby_out=lib --grpc_out=server protos/silly.proto
```
