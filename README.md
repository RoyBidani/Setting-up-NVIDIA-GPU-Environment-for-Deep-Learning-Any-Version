# Comprehensive Guide to Setting up NVIDIA GPU Environment for Deep Learning

This guide will walk you through the step-by-step process of setting up your environment for deep learning with NVIDIA GPU support. We'll cover installing the NVIDIA drivers, CUDA toolkit, cuDNN library, and TensorFlow. By following these steps, you'll have a fully functional environment ready for deep learning tasks.

## Prerequisites
Before you begin, ensure you have the following:
- An NVIDIA GPU supported by the desired CUDA version.
- A Ubuntu-based Linux distribution (e.g., Ubuntu 20.04 LTS).

## Step 1: Installing NVIDIA Drivers
1. Open a terminal window.
2. Create a new shell script file named `install_nvidia_driver.sh` and copy the provided script into it.
3. Make the script executable by running `chmod +x install_nvidia_driver.sh`.
4. Execute the script by running `./install_nvidia_driver.sh <desired_driver_version>`, replacing `<desired_driver_version>` with the version of the NVIDIA driver you want to install.

### Why:
- NVIDIA drivers are essential for GPU utilization and communication with the CUDA toolkit.

## Step 2: Installing CUDA Toolkit
1. Open a terminal window.
2. Create a new shell script file named `install_cuda.sh` and copy the provided script into it.
3. Make the script executable by running `chmod +x install_cuda.sh`.
4. Execute the script by running `./install_cuda.sh <desired_cuda_version>`, replacing `<desired_cuda_version>` with the version of the CUDA toolkit you want to install.

### Why:
- The CUDA toolkit provides libraries and tools necessary for GPU-accelerated computations.

## Step 3: Installing cuDNN Library
1. Open a terminal window.
2. Create a new shell script file named `install_cuDNN.sh` and copy the provided script into it.
3. Make the script executable by running `chmod +x install_cuDNN.sh`.
4. Execute the script by running `./install_cuDNN.sh`.

### Why:
- cuDNN (CUDA Deep Neural Network library) provides GPU-accelerated primitives for deep neural networks.

## Step 4: Installing TensorFlow
1. Open a terminal window.
2. Create a new shell script file named `install_tf.sh` and copy the provided script into it.
3. Make the script executable by running `chmod +x install_tf.sh`.
4. Execute the script by running `./install_tf.sh`.

### Why:
- TensorFlow is a popular deep learning framework that can leverage GPU acceleration for training and inference.

## Step 5: Cleanup (Optional)
If you need to remove any installed components or clean up your environment:
1. Open a terminal window.
2. Create a new shell script file named `cleanup.sh` and copy the provided script into it.
3. Make the script executable by running `chmod +x cleanup.sh`.
4. Execute the script by running `./cleanup.sh`.

### Why:
- Cleanup ensures that any unwanted packages or configurations are removed from your system.

## Compatibility Table

| Nvidia Driver | CUDA Version | cuDNN Version | TensorFlow Version |
|---------------|--------------|---------------|--------------------|
| 551.76        | 12.4         | 8.9           | 2.13               |
| 550.54.14     | 12.4         | 8.8           | 2.13               |
| 545.54.03     | 12.2         | 8.7           | 2.12               |
| 540.41.03     | 12.1         | 8.7           | 2.12               |
| 535.54.03     | 12.1         | 8.6           | 2.11               |
| 530.41.03     | 12.0         | 8.6           | 2.11               |
| 525.105.17    | 12.0         | 8.6           | 2.11               |
| 515.105.01    | 11.7         | 8.5           | 2.10               |
| 515.65.01     | 11.6         | 8.4           | 2.9                |
| 510.108.03    | 11.6         | 8.4           | 2.9                |
| 510.47.03     | 11.5         | 8.3           | 2.8                |
| 505.29.05     | 11.5         | 8.3           | 2.8                |
| 495.29.05     | 11.4         | 8.3           | 2.8                |
| 495.29.05     | 11.4         | 8.2           | 2.7                |
| 485.29.05     | 11.4         | 8.2           | 2.7                |
| 470.129.06    | 11.4         | 8.2           | 2.7                |
| 470.82.01     | 11.3         | 8.2           | 2.6                |
| 465.19.01     | 11.3         | 8.2           | 2.5                |
| 465.19.01     | 11.2         | 8.1           | 2.4                |
| 460.73.01     | 11.2         | 8.1           | 2.4                |
| 455.23.04     | 11.2         | 8.1           | 2.4                |

