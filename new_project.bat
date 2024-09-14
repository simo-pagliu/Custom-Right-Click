@echo off
:: Hide the CMD window
if not "%1" == "h" start /min cmd /c "%~f0" h & exit /b

:: Call PowerShell to display an input box for the folder name
for /f "delims=" %%F in ('powershell -NoProfile -Command "[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the name of the new project:', 'New Project', '')"') do set "parent_folder=%%F"

:: Check if the user canceled the dialog (i.e., input box was empty)
if "%parent_folder%"=="" (
    powershell -Command "[System.Windows.Forms.MessageBox]::Show('You did not enter a folder name. Exiting.', 'No Folder Name', 'OK', 'Error')"
    exit /b
)

:: Check if the folder already exists in the current directory
if exist "%cd%\%parent_folder%" (
    powershell -Command "[System.Windows.Forms.MessageBox]::Show('The folder already exists. Please choose a different name.', 'Folder Exists', 'OK', 'Error')"
    exit /b
)

:: Create the folder structure inside the specified parent folder
md "%cd%\%parent_folder%\dwg"
md "%cd%\%parent_folder%\APE\Doc Export"
md "%cd%\%parent_folder%\APE\Doc Sopralluogo"
md "%cd%\%parent_folder%\APE\old"
md "%cd%\%parent_folder%\L10\Doc Export"
md "%cd%\%parent_folder%\L10\old"
md "%cd%\%parent_folder%\Schede Tecniche"

:: Notify the user that the structure has been created
powershell -Command "[System.Windows.Forms.MessageBox]::Show('Folder structure has been created successfully.', 'Success', 'OK', 'Information')"

exit /b