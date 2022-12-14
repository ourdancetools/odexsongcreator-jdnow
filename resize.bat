@echo off
echo ODEX Song Resizer
echo by icebb
echo .
echo .
echo .
echo .
echo You need to install any version of https://www.imagemagick.org/script/download.php#windows
echo And then, create a shortcut in songs folder!
set /p "song=Enter song number:"
cd binMAGICK
echo . 
echo .
echo Resizing box.png
magick.exe convert "%CD%\..\%song%\art\box.jpg" -resize 129x129 "%CD%\..\%song%\art\box.png"
del %CD%\..\%song%\art\box.jpg
echo Resizing coach.dds
magick.exe convert "%CD%\..\%song%\art\coach.dds" -resize 326x326 "%CD%\..\%song%\art\coach.png"
del %CD%\..\%song%\art\coach.dds
echo Resizing 1.png
magick.exe convert "%CD%\..\%song%\player\1.png" -resize 256x256 "%CD%\..\%song%\player\1.png"
echo Resizing 2.png
magick.exe convert "%CD%\..\%song%\player\2.png" -resize 256x256 "%CD%\..\%song%\player\2.png"
echo Resizing 3.png
magick.exe convert "%CD%\..\%song%\player\3.png" -resize 256x256 "%CD%\..\%song%\player\3.png"
echo Resizing 4.png
magick.exe convert "%CD%\..\%song%\player\4.png" -resize 256x256 "%CD%\..\%song%\player\4.png"
pause
