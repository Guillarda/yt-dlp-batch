@echo off
title YT-DLP Music Downloader By Guillarda
set "Path=%Path%;%CD%\bin;"
ffmpeg -version > nul
if %errorlevel% NEQ 0 (
    echo FFMPEG is missing, we will download it, please wait
    echo If your connection is slow it will take some time
    curl https://data.guillarda.fr/ffmpeg/bin/ffmpeg.exe -o "./bin/ffmpeg.exe"
    echo.
) else (
    goto :yt-dlp-check
)
:yt-dlp-check
yt-dlp --version > nul
if %errorlevel% NEQ 0 (
    echo Downloading of yt-dlp
    curl https://data.guillarda.fr/yt-dlp/yt-dlp.exe -o "./bin/yt-dlp.exe"
    echo.
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