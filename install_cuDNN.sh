#!/bin/bash

# Step 1: Get CUDA version from user
read -p "Enter the CUDA version (11 or 12): " CUDA_VERSION

# Step 2: Install CUDA keyring and update package lists
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update

# Step 3: Install cuDNN based on CUDA version
if [ "$CUDA_VERSION" = "11" ]; then
   sudo apt-get -y install cudnn-cuda-11
   CUDA_PATH="$CUDA_HOME"
elif [ "$CUDA_VERSION" = "12" ]; then
   sudo apt-get -y install cudnn-cuda-12
   CUDA_PATH="$CUDA_HOME"
else
   echo "Invalid CUDA version entered. Exiting script."
   exit 1
fi

# Step 4: Reinstall cuDNN packages to ensure proper installation
sudo apt-get install --reinstall libcudnn8 libcudnn8-dev libcudnn8-samples -y

# Step 5: Locate and link cuDNN libraries
CUDNN_LIB_DIR=$(sudo find / -name "libcudnn.so" -exec dirname {} \; | head -n 1)
if [ -d "$CUDNN_LIB_DIR" ]; then
   sudo ln -sf $CUDNN_LIB_DIR/libcudnn* $CUDA_PATH/lib64/
fi

# Step 6: Update dynamic linker cache
sudo ldconfig

# Step 7: Add CUDA library path to ld.so.conf.d
echo "$CUDA_PATH/lib64" | sudo tee /etc/ld.so.conf.d/cuda.conf
sudo ldconfig

# Step 8: Compile and run cuDNN samples to verify functionality
if [ -d "/usr/src/cudnn_samples_v8/mnistCUDNN" ]; then
   cd /usr/src/cudnn_samples_v8/mnistCUDNN
   sudo make clean && sudo make
   ./mnistCUDNN
else
   echo "cuDNN samples directory not found. Skipping sample verification."
fi

# Step 9: Verify installations
nvidia-smi
nvcc --version
ldconfig -p | grep cudnn

echo "Installation and verification complete."

# Ask user if they want to reboot
read -p "Do you want to reboot the system? (y/n): " reboot_choice
if [ "$reboot_choice" = "y" ]; then
 echo "Rebooting system..."
 sudo reboot
else
 echo "completed. No reboot."
fi
