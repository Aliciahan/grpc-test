## FindGRPC.cmake - Find the gRPC library
##
## This module defines the following variables:
##   GRPC_FOUND - Whether gRPC was found
##   GRPC_INCLUDE_DIRS - The include directories for gRPC
##   GRPC_LIBRARIES - The gRPC libraries
#
#find_package(Protobuf REQUIRED)
#message(STATUS "Protobuf include dir: ${Protobuf_INCLUDE_DIRS}")
#
## Location of gRPC installation
#set(GRPC_ROOT_DIR "${CMAKE_SOURCE_DIR}/../install")
#
## Find the include directories
#find_path(GRPC_INCLUDE_DIR
#        NAMES grpcpp/grpcpp.h
#        HINTS ${GRPC_ROOT_DIR}/include
#)
#
## Find the libraries
#find_library(GRPC_CPP_LIB
#        NAMES grpc++
#        HINTS ${GRPC_ROOT_DIR}/lib
#)
#
#find_library(GRPC_LIB
#        NAMES grpc
#        HINTS ${GRPC_ROOT_DIR}/lib
#)
#
#find_library(GRPC_PROTOBUF_LIB
#        NAMES grpc++_reflection
#        HINTS ${GRPC_ROOT_DIR}/lib
#)
#
## Set results
#if (GRPC_INCLUDE_DIR AND GRPC_CPP_LIB AND GRPC_LIB AND GRPC_PROTOBUF_LIB)
#    set(GRPC_FOUND TRUE)
#    set(GRPC_LIBRARIES ${GRPC_CPP_LIB} ${GRPC_LIB} ${GRPC_PROTOBUF_LIB} ${Protobuf_LIBRARIES})
#    set(GRPC_INCLUDE_DIRS ${GRPC_INCLUDE_DIR} ${Protobuf_INCLUDE_DIRS})
#else()
#    set(GRPC_FOUND FALSE)
#endif()
#
#mark_as_advanced(
#        GRPC_INCLUDE_DIR
#        GRPC_CPP_LIB
#        GRPC_LIB
#        GRPC_PROTOBUF_LIB
#)
#
## If found, configure the variables
#if (GRPC_FOUND)
#    message(STATUS "Found gRPC: ${GRPC_LIBRARIES}")
#else()
#    message(FATAL_ERROR "gRPC not found, please set the GRPC_ROOT_DIR variable to the gRPC installation directory")
#endif()



include(FetchContent)
set(FETCHCONTENT_QUIET OFF)
set(ABSL_ENABLE_INSTALL ON)
FetchContent_Declare(
        absl
        GIT_REPOSITORY https://github.com/abseil/abseil-cpp.git
        GIT_TAG        origin/master
        OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(absl)

FetchContent_Declare(Protobuf
        GIT_REPOSITORY git@github.com:protocolbuffers/protobuf.git
        GIT_TAG        v29.0
        SOURCE_SUBDIR  cmake
        OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(Protobuf)
FetchContent_GetProperties(Protobuf SOURCE_DIR Protobuf_SOURCE_DIR)

FetchContent_Declare(
        gRPC
        GIT_REPOSITORY git@github.com:grpc/grpc
        GIT_TAG        v1.66.0 # e.g v1.28.0
        OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(gRPC)

find_package(absl REQUIRED)
find_package(gRPC REQUIRED)
find_package(Protobuf REQUIRED)