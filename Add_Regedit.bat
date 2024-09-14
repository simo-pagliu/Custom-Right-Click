@echo off
REM Add "New Project" to the right-click context menu

REM Create the "New Project" key
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\New Project" /f

REM Create the "command" subkey
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\New Project\command" /f

REM Set the default value of the "command" key
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\New Project\command" /ve /t REG_SZ /d "cmd /c start \"\" /min \"C:\Right_Click_Custom\new_project.bat\"" /f

echo "New Project" has been added to the context menu.
pause
