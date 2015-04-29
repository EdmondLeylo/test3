@echo off
setlocal enableextensions enabledelayedexpansion

set inputfile=file.txt

set tempfile=%random%-%random%.tmp

copy /y nul %tempfile%

set line=0

for /f "delims=:" %%v in ('findstr /n %1 file.txt') do set ln=%%v

for /f "delims=" %%l in (%inputfile%) do (
    set /a line+=1
    if !line!==%ln% (
        echo %2>>%tempfile%
    ) else (
        echo %%l>>%tempfile%
    )
)

del %inputfile%
ren %tempfile% %inputfile%

endlocal