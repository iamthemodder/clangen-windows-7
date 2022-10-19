@echo off

echo Extracting clangen archive...
7za.exe x -y -o%USERPROFILE%\ clangen-development.zip

echo Installing pygame and other dependencies...
pip install pygame ujson

echo Creating shortcut on desktop...
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") > %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\ClanGen.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%USERPROFILE%\clangen-development\main.py" >> %SCRIPT%
echo oLink.WorkingDirectory = "%USERPROFILE%\clangen-development" >> %SCRIPT%
echo oLink.IconLocation = "%USERPROFILE%\clangen-development\main.ico" >> %SCRIPT%
echo oLink.Description = "Run ClanGen!" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%

echo Cleaning up...
del %SCRIPT%
del clangen-development.zip
del 7za.exe
del 7za.dll
del 7zxa.dll
del README.md

echo Done! Press any key to exit!
pause >nul