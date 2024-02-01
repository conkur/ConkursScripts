:: Simplify the command line prompt for ease of comprehension
prompt $g

:: Set a title for the batch file window
Title List current quarantined items

:: search for the latest WD version, the latest subfolder in %ProgramData%MicrosoftWindows DefenderPlatform
:: It processes all subfolders in sequence so that last one to be set is the latest one
set "GetLatestVersionPath=dir "C:\ProgramData\Microsoft\Windows Defender\Platform" /ad /od /b"
FOR /F "tokens=*" %%i IN ('%GetLatestVersionPath%') Do Set "LatestVersionPath=%%i"

:: list quarantined files
"C:\ProgramData\Microsoft\Windows Defender\Platform\%LatestVersionPath%\MpCmdRun.exe"-listall

:: restore quarantied files
"C:\ProgramData\Microsoft\Windows Defender\Platform\%LatestVersionPath%\MpCmdRun.exe" -Restore -All
pause