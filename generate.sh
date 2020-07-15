# gRPCコード生成
protoc -I . \
  -Ivendor/protobuf/src \
  -Ivendor/googleapis \
  --go_out . \
  ./user.proto

# RESTのリバースプロキシ生成
protoc -I . \
  -Ivendor/protobuf/src \
  -Ivendor/googleapis \
   --grpc-gateway_out=logtostderr=true,paths=source_relative:./user/rpcs \
  ./user.proto

# swagger生成
protoc -I . \
  -Ivendor/protobuf/src \
  -Ivendor/googleapis \
   --swagger_out=logtostderr=true:./user/rpcs \
  ./user.proto
