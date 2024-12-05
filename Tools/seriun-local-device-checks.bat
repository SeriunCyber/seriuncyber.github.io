@echo off

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

:: Get Defender information using PowerShell
echo Checking Windows Defender status:
for /f "delims=" %%i in ('powershell -command "Get-MpComputerStatus | Select-Object -Property AMServiceVersion, AntispywareSignatureLastUpdated, AntispywareSignatureVersion, AntivirusSignatureLastUpdated, AntivirusSignatureVersion"') do echo %%i
echo -----------------------------------------------------

:: Pause to keep the window open
pause