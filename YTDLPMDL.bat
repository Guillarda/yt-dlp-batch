@echo off
title YT-DLP Music Downloader By Guillarda
yt-dlp -U
:home
Set /p link=What is the link of your wanted Video or Playlist (please one by one only) : 
echo This is the link you entered : "%link%"
echo.
yt-dlp -x --audio-format mp3 --embed-metadata --embed-thumbnail -o "Downloads/%%(title)s" "%link%"
echo.
Goto home