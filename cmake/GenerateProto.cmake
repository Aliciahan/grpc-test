find_package(Protobuf REQUIRED)
find_package(gRPC REQUIRED)

FetchContent_GetProperties(Protobuf SOURCE_DIR Protobuf_SOURCE_DIR)
# Include the cmake file that defines the protobuf_generate_cpp function
include(${Protobuf_SOURCE_DIR}/cmake/protobuf-generate.cmake)

add_library(workspace_proto OBJECT "${CMAKE_SOURCE_DIR}/proto/workspace.proto")
target_link_libraries(workspace_proto
        PUBLIC
        protobuf::libprotobuf
        grpc_plugin_support
        grpc
        grpc++
)

set(PROTO_BINARY_DIR "${CMAKE_SOURCE_DIR}/proto_libs")
file(MAKE_DIRECTORY ${PROTO_BINARY_DIR})
target_include_directories(workspace_proto PUBLIC "$<BUILD_INTERFACE:${PROTO_BINARY_DIR}>")

# Proto generation setup
set(PROTO_DIR "${CMAKE_SOURCE_DIR}/proto")
file(MAKE_DIRECTORY ${PROTO_BINARY_DIR})

# Define the proto files
set(PROTO_FILES
        "${PROTO_DIR}/workspace.proto"
        "${PROTO_DIR}/helloworld.proto"
)
# Generate C++ source files from proto
set(grpc_cpp_plugin_location $<TARGET_FILE:grpc_cpp_plugin>)
message(STATUS "grpc_cpp_plugin is ${grpc_cpp_plugin_location}")

protobuf_generate(
        TARGET workspace_proto
        LANGUAGE cpp
        GENERATE_EXTENSIONS .pb.h .pb.cc
#        PLUGIN "protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>"
        IMPORT_DIRS "${PROTO_DIR}"
        PROTOC_OUT_DIR "${PROTO_BINARY_DIR}"
        PROTOS ${PROTO_FILES}
)

protobuf_generate(
        TARGET workspace_proto
        LANGUAGE grpc
        GENERATE_EXTENSIONS .grpc.pb.h .grpc.pb.cc
        PLUGIN "protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>"
        IMPORT_DIRS "${PROTO_DIR}"
        PROTOC_OUT_DIR "${PROTO_BINARY_DIR}"
        PROTOS ${PROTO_FILES}
)

message(STATUS "proto Object is ${CMAKE_SOURCE_DIR}/proto/workspace.proto")
message(STATUS "proto dir is ${PROTO_BINARY_DIR}")