@echo off
setlocal enabledelayedexpansion

:: Get the current user
for /f "tokens=*" %%u in ('whoami') do set "CurrentUser=%%u"

:: Output the current user with horizontal lines
echo ---------------------------------
echo Current user: %CurrentUser%
echo ---------------------------------

:: List all users
echo All users:
for /f "skip=4 delims=" %%a in ('net user') do (
    if not "%%a"=="" (
        echo %%a | findstr /v "The command completed successfully." >nul && (
            for %%b in (%%a) do echo - %%b
        )
    )
)
echo ---------------------------------

:: List users in the local Administrators group
echo Users in the local admin group:
for /f "skip=6 tokens=*" %%a in ('net localgroup administrators') do (
    if not "%%a"=="" (
        :: Skip the separator line with dashes
        echo %%a | findstr /r "^-*$" >nul
        if errorlevel 1 (
            :: Skip the "The command completed successfully." line
            echo %%a | findstr /i "The command completed successfully." >nul
            if errorlevel 1 (
                echo - %%a
            )
        )
    )
)
echo -----------------------------------------------------

:: Check if Webroot SecureAnywhere is installed by checking the WRSA.exe file
echo Checking for Webroot SecureAnywhere installation:
set "WebrootPath=%ProgramFiles%\Webroot\WRSA.exe"
if not exist "%WebrootPath%" (
    set "WebrootPath=%ProgramFiles(x86)%\Webroot\WRSA.exe"
)

echo WebrootPath: !WebrootPath!

if exist "!WebrootPath!" (
    echo Webroot is installed.
    echo Retrieving Webroot version...
    for /f "tokens=3" %%v in ('"wmic datafile where name="!WebrootPath:\=\\!" get version"') do echo Webroot SecureAnywhere version: %%v
    echo -----------------------------------------------------
) else (
    echo Webroot is not installed. Checking Windows Defender status:
    for /f "delims=" %%i in ('powershell -command "Get-MpComputerStatus | Select-Object -Property AMServiceVersion, AntispywareSignatureLastUpdated, AntispywareSignatureVersion, AntivirusSignatureLastUpdated, AntivirusSignatureVersion"') do echo %%i
    echo -----------------------------------------------------
)

:: Pause to keep the window open
pause