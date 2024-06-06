# Comprehensive Guide to Setting up NVIDIA GPU Environment for Deep Learning

This guide will walk you through the step-by-step process of setting up your environment for deep learning with NVIDIA GPU support. We'll cover installing the NVIDIA drivers, CUDA toolkit, cuDNN library, and TensorFlow. By following these steps, you'll have a fully functional environment ready for deep learning tasks.

## Prerequisites
Before you begin, ensure you have the following:
- An NVIDIA GPU supported by the desired CUDA version.
- A Ubuntu-based Linux distribution (e.g., Ubuntu 20.04 LTS).

## Step 1: Installing NVIDIA Drivers
1. Download the shell script file named `install_nvidia_driver.sh` .
2. Make the script executable by running `chmod +x install_nvidia_driver.sh`.
3. Execute the script by running `./install_nvidia_driver.sh <desired_driver_version>`, replacing `<desired_driver_version>` with the version of the NVIDIA driver you want to install.
4. At the end of the script, the prompt ask you to confirm whether to reboot. Only proceed with the reboot if the final test line in the script fails to produce the expected output. 

### Why:
- NVIDIA drivers are essential for GPU utilization and communication with the CUDA toolkit.

## Step 2: Installing CUDA Toolkit
1. Download the shell script file named `install_cuda.sh` .
2. Make the script executable by running `chmod +x install_cuda.sh`.
3. Execute the script by running `./install_cuda.sh <desired_cuda_version>`, replacing `<desired_cuda_version>` with the version of the CUDA toolkit you want to install (without version - download basic version)
4. At the end of the script, the prompt ask you to confirm whether to reboot. Only proceed with the reboot if the final test line in the script fails to produce the expected output. 


### Why:
- The CUDA toolkit provides libraries and tools necessary for GPU-accelerated computations.

## Step 3: Installing cuDNN Library
1. Download the shell script file named `install_cuDNN.sh` .
2. Make the script executable by running `chmod +x install_cuDNN.sh`.
3. Execute the script by running `./install_cuDNN.sh`.
4. Choose you CUDA series 11/12 (to match the installation)
5. At the end of the script, the prompt ask you to confirm whether to reboot. Only proceed with the reboot if the final test line in the script fails to produce the expected output. 


### Why:
- cuDNN (CUDA Deep Neural Network library) provides GPU-accelerated primitives for deep neural networks.

## Step 4: Installing TensorFlow
1. Download the shell script file named `install_tf.sh` and copy the provided script into it.
2. Make the script executable by running `chmod +x install_tf.sh`.
3. Execute the script by running `./install_tf.sh <desired_tensorflow_version>`, replacing `<desired_tensorflow_version>` with the version of the TensorFlow you want to install (without version - download 2.10.* version)
4. At the end of the script, the prompt ask you to confirm whether to reboot. Only proceed with the reboot if the final test line in the script fails to produce the expected output. 


### Why:
- TensorFlow is a popular deep learning framework that can leverage GPU acceleration for training and inference.

## Additional: Cleanup 
1. Download the shell script file named `cleanup.sh`.
2. Make the script executable by running `chmod +x cleanup.sh`.
3. Execute the script by running `./cleanup.sh`.
4. At the end of the script, the prompt ask you to confirm whether to reboot. Only proceed with the reboot if the final test line in the script fails to produce the expected output. 


### Why:
- Cleanup ensures that any unwanted packages or configurations are removed from your system.

## Compatibility Table


| Nvidia Driver | CUDA Version | cuDNN Version | TensorFlow Version |
|---------------|--------------|---------------|-------------------|
| 551.76        | 12.3         | 8.9           | 2.16.1             |
| 550.54.14     | 12.2         | 8.9           | 2.15.0             |
| 545.54.03     | 11.8         | 8.7           | 2.14.0             |
| 540.41.03     | 11.8         | 8.6           | 2.13.0             |
| 535.54.03     | 11.8         | 8.6           | 2.12.0             |
| 530.41.03     | 11.2         | 8.1           | 2.11.0             |
| 525.105.17    | 11.2         | 8.1           | 2.10.0             |
| 515.105.01    | 11.2         | 8.1           | 2.9.0              |
| 515.65.01     | 11.2         | 8.1           | 2.8.0              |
| 510.108.03    | 11.2         | 8.1           | 2.7.0              |
| 510.47.03     | 11.2         | 8.1           | 2.6.0              |
| 505.29.05     | 11.2         | 8.1           | 2.5.0              |
| 495.29.05     | 11.0         | 8.0           | 2.4.0              |
| 495.29.05     | 10.1         | 7.6           | 2.3.0              |
| 485.29.05     | 10.1         | 7.6           | 2.2.0              |
| 470.129.06    | 10.1         | 7.6           | 2.1.0              |
| 470.82.01     | 10.0         | 7.4           | 2.0.0              |



