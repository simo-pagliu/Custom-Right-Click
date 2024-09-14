@echo off
REM Script to create a directory in C: and copy new_project.bat into it

:: Define the target directory
set "target_dir=C:\Right_Click_Custom"

:: Create the directory if it doesn't exist
if not exist "%target_dir%" (
    mkdir "%target_dir%"
    echo Created directory "%target_dir%".
) else (
    echo Directory "%target_dir%" already exists.
)

:: Check if new_project.bat exists in the current directory
if exist "%~dp0new_project.bat" (
    :: Copy new_project.bat to the target directory
    copy "%~dp0new_project.bat" "%target_dir%\"
    echo Copied "new_project.bat" to "%target_dir%".
) else (
    echo "new_project.bat" not found in the current directory.
    echo Please make sure "new_project.bat" is in the same directory as this script.
    pause
    exit /b
)

echo Operation completed successfully.
pause
