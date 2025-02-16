//
// Created by Alicia HAN on 15/02/2025.
//

#ifndef WORKSPACESERVICEIMPL_H
#define WORKSPACESERVICEIMPL_H
#include "../proto/workspace.grpc.pb.h"
#include <grpcpp/grpcpp.h>

class WorkspaceServiceImpl final : public workspace::Workspace::Service {
public:
    grpc::Status Create(grpc::ServerContext* context, const workspace::CreateRequest* request, workspace::CreateResponse* response) override {
        std::string prefix("Hello ");
        response->set_msg("hello world");
        return grpc::Status::OK;
    };

};


#endif //WORKSPACESERVICEIMPL_H
