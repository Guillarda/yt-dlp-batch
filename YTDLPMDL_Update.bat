@echo off
title YT-DLP Music Downloader By Guillarda
set "Path=%Path%;%CD%\bin;"
yt-dlp --version > nul
if %errorlevel% NEQ 0 (
    cls
    echo Downloading of yt-dlp
    "./bin/wget.exe" https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O "./bin/yt-dlp.exe" -q
    goto :end
) else (
    goto :home
)
:home
yt-dlp -U

:end
PAUSE