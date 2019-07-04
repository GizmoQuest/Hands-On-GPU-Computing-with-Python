#!/bin/bash
#HIPify - a unique tool from ROCm to easily convert CUDA code into HIP. 
#1. First, install all dependencies to install and run hipify:
sudo apt update
sudo apt -y install git cmake clang-6.0 libclang-6.0-dev libclang-perl libclanlib-dev libclang-dev zlib1g-dev
git clone https://github.com/GPUOpen-ProfessionalCompute-Tools/HIP HIP
cd HIP/hipify-clang/
mkdir build dist
cd build
cmake \
-DCMAKE_INSTALL_PREFIX=../dist \
-DCMAKE_BUILD_TYPE=Release \
..
#2. Now, install hipify in the same build location:
make -j install
#3. Now, to set up the hipify command, use the following command:
echo 'alias hipify=~/HIP/hipify-clang/dist/bin/./hipify-clang' >> ~/.bashrc
#Reload the Bash shell:
. ~/.bashrc
#Run HIPify as "hipify CUDA-program.cu to HIP-program.cpp"
