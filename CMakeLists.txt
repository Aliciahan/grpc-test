cmake_minimum_required(VERSION 3.15)
project(s2m_workspace)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/install)
set(CMAKE_PREFIX_PATH ${CMAKE_SOURCE_DIR}/install)

# Add cmake module path
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(FindGRPC)

find_package(Protobuf REQUIRED)
find_package(gRPC REQUIRED)

include(GenerateProto)

include_directories("${PROTO_BINARY_DIR}")
add_executable(s2m_workspace
        src/main.cpp
        ${PROTO_BINARY_DIR}/workspace.grpc.pb.cc
        ${PROTO_BINARY_DIR}/workspace.pb.cc
)
target_link_libraries(s2m_workspace
        ${Protobuf_LIBRARIES}
        grpc
        grpc++
)

add_dependencies(s2m_workspace workspace_proto)
