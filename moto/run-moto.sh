#!/bin/bash

# Check if the user is "oithondhagan" and alias python to py
#doe has is non MS install of python aliased, so use that one
if [ "$USERNAME" == "vhajithagand" ]; then
     alias python="py"
fi

# Create a virtual environment in the current directory
python -m venv moto_env

# Activate the virtual environment
source moto_env/Scripts/activate

# Install moto with all extras
python -m pip install moto[all] flask flask_cors

# Set the LOG_LEVEL environment variable for debugging (optional)
export LOG_LEVEL=DEBUG

# Run moto_server on port 5000
moto_server -p 4566

# Deactivate the virtual environment when done (optional)
deactivate

