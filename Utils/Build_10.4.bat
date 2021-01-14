rem Verify and change to the path for your rsvars.bat as needed
rem The default for 10.4 Sydney is C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat
call "C:\Delphi10.4\bin\rsvars.bat"

rem The first expected parameter is the target work folder
cd /D %1

rem second parameter is .dproj filename with relative path within work folder
rem third parameter is profile to use (Debug, Release)
rem fourth parameter is target platform (Win32, Win64, etc)
msbuild %2 /t:build /p:Configuration=%3 /p:platform=%4

