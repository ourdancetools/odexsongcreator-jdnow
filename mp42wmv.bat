@echo off
set /p "song=song: "
rename "%CD%\%song%\video\video.wmv" "video.mp4"
ffmpeg -i "%CD%\%song%\video\video.mp4" -c:v wmv2 -b:v 1024k -c:a wmav2 -b:a 192k "%CD%\%song%\video\video.wmv"