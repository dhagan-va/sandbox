# Display the current user running the script
Write-Host "Script is being run by user: $env:USERNAME"

# Check if the user is "vhajithagand" and alias python to py
if ($env:USERNAME -eq "vhajithagand") {
    Write-Host "User is vhajithagand, using Python Launcher (py.exe)"
    $python = "py"
} else {
    Write-Host "User is not vhajithagand, using default python"
    $python = "python"
}

# Create a virtual environment in the current directory
& $python -m venv moto_env

# Activate the virtual environment
# Note: PowerShell uses `Activate.ps1` for activation
& .\moto_env\Scripts\Activate.ps1

# Install moto with all extras
& $python -m pip install moto[all] flask flask_cors

# Set the LOG_LEVEL environment variable for debugging (optional)
$env:LOG_LEVEL = "DEBUG"

# Run moto_server on port 4566
Write-Host "Starting moto_server on port 4566..."
& .\moto_env\Scripts\moto_server.exe -p 4566

# Deactivate the virtual environment when done (optional)
Write-Host "Deactivating virtual environment..."
& .\moto_env\Scripts\deactivate.ps1