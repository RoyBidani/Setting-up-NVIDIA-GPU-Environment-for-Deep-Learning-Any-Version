#!/bin/bash
# Check if version argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide the desired NVIDIA driver version as an argument (e.g., 535)."
  exit 1
fi

# Get the desired driver version from the command line argument
version=$1

# Update and install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential dkms -y

# Add NVIDIA PPA
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update

# Install NVIDIA driver
sudo apt install nvidia-driver-$version -y

# Verify NVIDIA driver
nvidia-smi

# Ask user if they want to reboot
read -p "Do you want to reboot the system? (y/n): " reboot_choice
if [ "$reboot_choice" = "y" ]; then
  echo "Rebooting system..."
  sudo reboot
else
  echo "completed. No reboot."
fi
