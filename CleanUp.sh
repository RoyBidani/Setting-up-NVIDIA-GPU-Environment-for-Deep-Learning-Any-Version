#!/bin/bash

# Function to remove a package if it is installed
remove_package() {
  if dpkg -l | grep -q "$1"; then
    sudo apt-get --purge remove -y "$1"
  fi
}

# Fix broken packages
echo "Fixing broken packages..."
sudo apt --fix-broken install -y

# Uninstall NVIDIA drivers
echo "Removing NVIDIA drivers..."
sudo apt-get purge -y '^nvidia-.*'
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# Uninstall CUDA
echo "Removing CUDA..."
sudo apt-get --purge remove -y cuda
sudo apt-get --purge remove -y cuda-toolkit-*
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# Uninstall cuDNN
echo "Removing cuDNN..."
sudo apt-get --purge remove -y cudnn-cuda-*
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# Remove CUDA and cuDNN directories
echo "Deleting CUDA and cuDNN directories..."
sudo rm -rf /usr/local/cuda*
sudo rm -rf /usr/local/cudnn*

# Clean up environment variables
echo "Cleaning up environment variables..."
sed -i '/export CUDA_HOME=\/usr\/local\/cuda-.*$/d' ~/.bashrc
sed -i '/export LD_LIBRARY_PATH=\/usr\/local\/cuda-.*\/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}$/d' ~/.bashrc
sed -i '/export PATH=\/usr\/local\/cuda-.*\/bin${PATH:+:${PATH}}$/d' ~/.bashrc
sed -i '/export CUDA_VERSION=.*$/d' ~/.bashrc
source ~/.bashrc

# Remove CUDA keyring
echo "Removing CUDA keyring..."
sudo apt-get --purge remove -y cuda-keyring
sudo apt-get autoremove -y
sudo apt-get autoclean -y
CUDA_KEY_ID=$(apt-key list | grep "CUDA" | awk '{print $2}' | head -n 1)
sudo apt-key del "$CUDA_KEY_ID"

# Remove TensorFlow
echo "Uninstalling TensorFlow..."
pip uninstall -y tensorflow
sudo pip uninstall -y tensorflow

# Remove virtual environments
echo "Removing virtual environments..."
find . -type d -name "venv" -exec rm -rf {} +

# Remove remaining directories
echo "Deleting remaining directories..."
sudo rm -rf ~/test-gpu

# Remove downloaded .deb files
echo "Deleting downloaded .deb files..."
find . -maxdepth 1 -type f -name "*.deb.*" -delete

# Fix any remaining broken packages
echo "Fixing any remaining broken packages..."
sudo apt --fix-broken install -y

# Ask user if they want to reboot
read -p "Do you want to reboot the system? (y/n): " reboot_choice
if [ "$reboot_choice" = "y" ]; then
  echo "Rebooting system..."
  sudo reboot
else
  echo "Cleanup completed. No reboot."
fi
