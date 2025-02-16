cmake_minimum_required(VERSION 3.29)
project(s2m_workspace)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/install)
set(CMAKE_PREFIX_PATH ${CMAKE_SOURCE_DIR}/install)

# Add cmake module path
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
# Find Protobuf and gRPC
include(FindGRPC)
find_package(GRPC REQUIRED)
if(NOT GRPC_FOUND)
    message(FATAL_ERROR "gRPC not found")
else()
    message(STATUS "Found gRPC: ${GRPC_LIBRARIES}")
    include_directories(${GRPC_INCLUDE_DIRS})
endif()

add_subdirectory(src)
#add_subdirectory(test)

#set(GRPC_ROOT_DIR "${CMAKE_SOURCE_DIR}/install")
#if (NOT gRPC_FOUND)
#    message(FATAL_ERROR "gRPC not found)
#else()
#    include_directories(${GRPC_INCLUDE_DIRS})
#endif()
#
#
#
#include_directories(${CMAKE_SOURCE_DIR}/install/include)
#link_directories(${CMAKE_SOURCE_DIR}/install/lib)
#
## Find Protobuf package
#find_package(Protobuf REQUIRED)
#include_directories(${Protobuf_INCLUDE_DIRS})
#link_directories(${Protobuf_LIBRARY_DIRS})
#
## Find gRPC package
#find_package(gRPC REQUIRED)
#include_directories(${gRPC_INCLUDE_DIRS})
#link_directories(${gRPC_LIBRARY_DIRS})
#
##add_subdirectory(src)
## Proto generation setup
#set(PROTO_DIR "${CMAKE_SOURCE_DIR}/proto")
#set(PROTO_SRC_DIR "${CMAKE_SOURCE_DIR}/src")
#set(PROTO_FILES "${PROTO_DIR}/workspace.proto")
#
#
## Generate C++ source files from proto
#protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS ${PROTO_FILES})
#grpc_generate_cpp(GRPC_SRCS GRPC_HDRS ${PROTO_FILES})

#add_executable(s2m_workspace
#        main.cpp
#        ${PROTO_SRCS}
#        ${PROTO_HDRS}
#        ${GRPC_SRCS}
#        ${GRPC_HDRS}
#)
#target_link_libraries(s2m_workspace ${GRPC_LIBRARIES} ${Protobuf_LIBRARIES})
#
