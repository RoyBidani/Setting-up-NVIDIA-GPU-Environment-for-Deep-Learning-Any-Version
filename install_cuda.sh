#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No CUDA version specified. Installing the default CUDA toolkit."
  CUDA_COMMAND="sudo apt install nvidia-cuda-toolkit -y"
else
  CUDA_VERSION=$1
  CUDA_COMMAND="sudo apt install cuda-$CUDA_VERSION -y"
fi

# Remove conflicting packages
echo "Removing conflicting packages..."
sudo apt remove -y cuda-cccl-*

# Clean up any partially installed packages
echo "Cleaning up partially installed packages..."
sudo apt clean
sudo apt autoremove -y

# Fix broken packages
echo "Fixing broken packages..."
sudo apt --fix-broken install -y

# Clean up environment variables
echo "Cleaning up environment variables..."
sed -i '/export CUDA_HOME=\/usr\/local\/cuda-.*$/d' ~/.bashrc
sed -i '/export LD_LIBRARY_PATH=\/usr\/local\/cuda-.*\/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}$/d' ~/.bashrc
sed -i '/export PATH=\/usr\/local\/cuda-.*\/bin${PATH:+:${PATH}}$/d' ~/.bashrc
sed -i '/export CUDA_VERSION=.*$/d' ~/.bashrc

# Update the package list
echo "Updating package list..."
sudo apt update

# Add NVIDIA CUDA PPA
echo "Adding NVIDIA CUDA PPA..."
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update

# Install CUDA Toolkit
echo "Installing CUDA Toolkit..."
eval "$CUDA_COMMAND"
if [ $? -ne 0 ]; then
  echo "CUDA Toolkit installation failed. Exiting script."
  exit 1
fi

# Clean up after installation
echo "Cleaning up after installation..."
sudo apt autoremove -y

# Setup environment variables
echo "Setting up environment variables..."
if [ $# -eq 0 ]; then
  CUDA_HOME=$(find /usr/local -maxdepth 1 -type d -name "cuda-*" | sort -r | head -n1)
  CUDA_VERSION=$(echo $CUDA_HOME | cut -d'-' -f2)
else
  CUDA_HOME="/usr/local/cuda-$CUDA_VERSION"
fi
echo "export CUDA_HOME=$CUDA_HOME" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$CUDA_HOME/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ~/.bashrc
echo "export PATH=$CUDA_HOME/bin\${PATH:+:\${PATH}}" >> ~/.bashrc
echo "export CUDA_VERSION=$CUDA_VERSION" >> ~/.bashrc
source ~/.bashrc
# Verify CUDA installation

nvcc --version

if [ $? -ne 0 ]; then
  echo "CUDA verification failed. Please check the installation manually."
else
  echo "CUDA installation verified successfully."
fi

# Ask user if they want to reboot
read -p "Do you want to reboot the system? (y/n): " reboot_choice
if [ "$reboot_choice" = "y" ]; then
  echo "Rebooting system..."
  sudo reboot
else
  echo "Installation completed. No reboot."
fi
