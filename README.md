# gRPC example

In this example, the server has a single function to sleep for a specific
seconds before return. The client calls the function and wait for server
response, then print out whatever returned

## Development

Regenerate the code with:

```sh
grpc_tools_ruby_protoc -I ./protos --ruby_out=lib --grpc_out=lib protos/*
```

Client still need to reference the `Stub` in server code, so `ruby_out` and
`grpc_out` should point to the same directory.

`./server.rb` to start the server, then `./client.rb <duration>` (`<duration>`
is the number of seconds to sleep) to send a message.
