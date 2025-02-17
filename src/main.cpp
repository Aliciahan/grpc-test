#include <iostream>

// void RunServer() {
//     std::string server_address("0.0.0.0:8080");
//     WorkspaceServiceImpl service;
//     grpc::ServerBuilder builder;
//     builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
//     builder.RegisterService(&service);
//     std::unique_ptr<grpc::Server> server(builder.BuildAndStart());
//     std::cout << "Server listening on " << server_address << std::endl;
//     server -> Wait();
// }

int main()
{
  // RunServer();return 0;
  std::cout << "Hello, World!" << std::endl;
}

