cmake_minimum_required(VERSION 3.29)

## Proto generation setup
#get_filename_component(workspace_proto "proto/workspace.proto" ABSOLUTE)
#get_filename_component(workspace_proto_path "${workspace_proto}" PATH)

# Generate C++ source files from proto


#message(STATUS "file saved to ${workspace_proto_srcs}")
#find_package(Protobuf REQUIRED)
#find_package(gRPC REQUIRED)
#get_filename_component(protoc_exec "install/bin/protoc" ABSOLUTE)
#message(STATUS "the exe is ${protoc_exec}")
#add_custom_command(
#      OUTPUT "${workspace_proto_srcs}" "${workspace_proto_hdrs}" "${workspace_grpc_srcs}" "${workspace_grpc_hdrs}"
#      COMMAND ${protoc_exec}
#      ARGS --grpc_out "${CMAKE_CURRENT_BINARY_DIR}" --cpp_out "${CMAKE_CURRENT_BINARY_DIR}"
#        -I "${workspace_proto_path}"
#        --plugin=protoc-gen-grpc="${_GRPC_CPP_PLUGIN_EXECUTABLE}"
#        "${workspace_proto}"
#      DEPENDS "${workspace_proto}")
#
# Include generated *.pb.h files

# add the ../proto directory to the include path
set(PROTO_DIR "${CMAKE_SOURCE_DIR}/proto")
message(STATUS "proto dir is ${PROTO_DIR}")


include_directories(${CMAKE_CURRENT_BINARY_DIR}/proto)
set(source_files
        ../proto/workspace.grpc.pb.cc
        ../proto/workspace.pb.cc
        ../proto/workspace.pb.h
        ../proto/workspace.grpc.pb.h
        ../include/WorkspaceServiceImpl.cpp
        ../include/WorkspaceServiceImpl.h
)
add_library(
        s2m_workspace_proto
        ${source_files}
)

# Main server executable
add_executable(s2m_workspace
        main.cpp
        ${source_files}
        ../include/WorkspaceServiceImpl.cpp
        ../include/WorkspaceServiceImpl.h


)
target_link_libraries(s2m_workspace
        s2m_workspace_proto
        ${_REFLECTION}
        ${_GRPC_GRPCPP}
        ${_PROTOBUF_LIBPROTOBUF}
)