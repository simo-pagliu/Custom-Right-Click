@echo off
REM Installer script to execute create_folder_and_file.bat and Add_Regedit.bat
REM This script requests administrative privileges and executes the other two scripts

:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo "Requesting administrative privileges..."
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Set the directory where the other scripts are located
set "script_dir=%~dp0"

:: Execute create_folder_and_file.bat
echo Running create_folder_and_file.bat...
call "%script_dir%create_folder_and_file.bat"

:: Check if the previous script executed successfully
if %errorlevel% neq 0 (
    echo "Error occurred while running create_folder_and_file.bat."
    pause
    exit /b
)

:: Execute Add_Regedit.bat
echo Running Add_Regedit.bat...
call "%script_dir%Add_Regedit.bat"

:: Check if the previous script executed successfully
if %errorlevel% neq 0 (
    echo "Error occurred while running Add_Regedit.bat."
    pause
    exit /b
)

echo Installation complete. All scripts have been executed successfully.
pause
