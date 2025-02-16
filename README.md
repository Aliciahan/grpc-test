# C++ S2M Workspace

## System Prepare

~~~bash
brew cmake install autoconf automake libtool pkg-config openssl@3
mkdir ./install
~~~

## gRPC local

~~~bash
export MY_INSTALL_DIR=$PWD/install
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

git clone --recurse-submodules -b v1.70.1 --depth 1 --shallow-submodules https://github.com/grpc/grpc

cd grpc
mkdir -p cmake/build
pushd cmake/build
cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
      ../..
make -j 4
make install
popd

~~~

## Generate C++ Code from Protobuf

~~~bash
./install/bin/protoc \
--grpc_out proto/ \
--cpp_out proto/ \
-I proto/ \
--plugin=protoc-gen-grpc=./install/bin/grpc_cpp_plugin \
proto/workspace.proto 
~~~

