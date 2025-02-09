#!/bin/zsh

# Set script to exit on error
set -e

# Get the parent directory of where the script is located
PARENT_DIR="$(realpath)"
echo $PARENT_DIR

# Activate virtual environment
if [ -f "$PARENT_DIR/.venv/bin/activate" ]; then
    source "$PARENT_DIR/.venv/bin/activate"
    
    pip install -U $(pip list --outdated --format=columns | cut -d' ' -f 1)

    python3 "$PARENT_DIR/gradio_interface.py"
    deactivate
else
    echo "Virtual environment is not active."
fi

# Capture the exit status of the python3 command
EXIT_STATUS=$?

# Exit with the captured status
exit $EXIT_STATUS