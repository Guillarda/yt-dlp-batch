@echo off
title YT-DLP Music Downloader By Guillarda
set "Path=%Path%;%CD%\bin;"
yt-dlp --version > nul
if %errorlevel% NEQ 0 (
    cls
    echo Downloading of yt-dlp
    "./bin/wget.exe" https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O "./bin/yt-dlp.exe" -q
) else (
    goto :home
)
:home
Set /p link=What is the link of your wanted Video or Playlist (please one by one only) : 
echo This is the link you entered : "%link%"
echo.
yt-dlp -x --audio-format mp3 --embed-metadata --embed-thumbnail -o "Downloads/%%(title)s" "%link%"
echo.
Goto home