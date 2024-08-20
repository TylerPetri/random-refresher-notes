conda install -c apple tensorflow-deps
pip install tensorflow-macos
pip install tensorflow-metal
conda install -c conda-forge -y pandas jupyter
jupyter notebook

import tensorflow as tf
# Check for TensorFlow GPU access
print(f"TensorFlow has access to the following devices:\n{tf.config.list_physical_devices()}")
# See TensorFlow version
print(f"TensorFlow version: {tf.__version__}")

test:
pip install tensorflow_datasets
