@echo off
echo VoiceIQ — M4A to MP3 Converter
echo ================================
echo.

set AUDIO_DIR=%~dp0Audio

if not exist "%AUDIO_DIR%" (
    echo ERROR: Audio folder not found at %AUDIO_DIR%
    pause
    exit /b 1
)

cd /d "%AUDIO_DIR%"

set COUNT=0
for %%f in (*.m4a) do (
    echo Converting: %%f
    ffmpeg -i "%%f" -codec:a libmp3lame -qscale:a 2 -y "%%~nf.mp3" -loglevel error
    if errorlevel 1 (
        echo   ERROR converting %%f
    ) else (
        echo   Done: %%~nf.mp3
        set /a COUNT+=1
    )
)

echo.
echo Converted %COUNT% file(s).
echo.
pause
