#!/bin/bash
# Get TensorFlow version from user
read -p "Enter the desired TensorFlow version (2.16.1 or 2.10.*): " TF_VERSION
# Create and activate virtual environment
mkdir ~/test-gpu && cd ~/test-gpu
python3 -m venv venv
source venv/bin/activate
# Install TensorFlow based on user input
pip install --upgrade pip
if [ "$TF_VERSION" = "2.16.1" ]; then
  pip install tensorflow==2.16.1
elif [ "$TF_VERSION" = "2.10.*" ]; then
  pip install tensorflow==2.10.*
else
  echo "Invalid TensorFlow version entered. Exiting script."
  exit 1
fi
# Verify TensorFlow installation
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU')); print('TensorFlow version:', tf.__version__)"
# Ask user if they want to reboot
read -p "Do you want to reboot the system? (y/n): " reboot_choice
if [ "$reboot_choice" = "y" ]; then
  echo "Rebooting system..."
  sudo reboot
else
  echo "completed. No reboot."
fi
