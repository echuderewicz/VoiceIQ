@echo off
chcp 65001 >nul
echo VoiceIQ - M4A to MP3 Converter
echo ================================
echo.

set M4A_DIR=%~dp0Audio\m4a
set MP3_DIR=%~dp0Audio

if not exist "%M4A_DIR%" (
    echo ERROR: Audio\m4a folder not found.
    echo Please create it at: %M4A_DIR%
    pause
    exit /b 1
)

set COUNT=0
set SKIP=0

for %%f in ("%M4A_DIR%\*.m4a") do (
    set "BASENAME=%%~nf"
    if exist "%MP3_DIR%\%%~nf.mp3" (
        echo Skipping: %%~nxf  [already converted]
        set /a SKIP+=1
    ) else (
        echo Converting: %%~nxf
        ffmpeg -i "%%f" -codec:a libmp3lame -qscale:a 2 -y "%MP3_DIR%\%%~nf.mp3" -loglevel error
        if errorlevel 1 (
            echo   ERROR converting %%~nxf
        ) else (
            echo   Done: %%~nf.mp3
            set /a COUNT+=1
        )
    )
)

echo.
echo Converted %COUNT% new file(s). Skipped %SKIP% already converted.
echo.
pause
