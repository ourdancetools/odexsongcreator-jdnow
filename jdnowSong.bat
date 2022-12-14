@echo off
echo ODEX Song Creator (using just dance now)
echo by icebb
echo .
echo .
echo .
set /p "song=Enter the song number: "
mkdir %song%
cd %song%


echo To know the 'codename_codenumber', you need to acess "https://ire-prod-api.justdancenow.com/v1/songs/published" and search (Ctrl+F) for your song name or codename.
echo And then copy the 'codename_codenumber', for example:  the name_number of #thatPOWER is ThatPower_1598550099602.
set /p "id_num=Enter codename_codenumber: "
set /p "id=Enter codename (the part before "_"): "
set /p "id_lowercase=Enter the codename, but in lowercase: "

set /p "name=Enter song's name: "
set /p "artist=Enter song's artist: "
set /p "bpm=Enter song's bpm (if you don't know, just put 120 and change after): "
set /p "coachnum=Enter number of coaches: "

echo .
echo .
echo .

echo [info] >> data.ini
echo name=%artist% - %name% >> data.ini
echo bpm=%bpm% >> data.ini
echo color=0 >> data.ini
echo coach=%coachnum% >> data.ini
echo alpha=0 >> data.ini
echo credits=Also created using ODEX Song Creator by icebb :) >> data.ini
echo Created data.ini file!
echo Remember to edit goldmoves...
echo .
echo .
echo .
echo .
echo .
echo Creating folders
mkdir art
mkdir moves
mkdir player
mkdir video
echo !!! Don't be scared if some error messages comes up if your number of coaches is less than 4, the bat tries to download all 4 coaches. !!!
echo Downloading "art/bg.png"
echo (It can maybe take one minute to start the download, but only on first time!)
powershell -Command "Invoke-WebRequest https://jdnow-api-contentapistoragest.justdancenow.com/map_bkg/%id%_map_bkg.jpg -Outfile art/bg.jpg"
echo Downloading "art/box.png"
powershell -Command "Invoke-WebRequest https://jdnow-api-contentapistoragest.justdancenow.com/songs/%id_num%/assets/web/%id_lowercase%.jpg -Outfile art/box.jpg"

echo Downloading "player/1.png"
powershell -Command "Invoke-WebRequest https://jdnow-api-contentapistoragest.justdancenow.com/songs/%id_num%/assets/common/coaches/%id_lowercase%_coach_1_big.png -Outfile player/1.png"
echo Downloading "player/2.png"
powershell -Command "Invoke-WebRequest https://jdnow-api-contentapistoragest.justdancenow.com/songs/%id_num%/assets/common/coaches/%id_lowercase%_coach_2_big.png -Outfile player/2.png"
echo Downloading "player/3.png"
powershell -Command "Invoke-WebRequest https://jdnow-api-contentapistoragest.justdancenow.com/songs/%id_num%/assets/common/coaches/%id_lowercase%_coach_3_big.png -Outfile player/3.png"
echo Downloading "player/4.png"
powershell -Command "Invoke-WebRequest https://jdnow-api-contentapistoragest.justdancenow.com/songs/%id_num%/assets/common/coaches/%id_lowercase%_coach_4_big.png -Outfile player/4.png"
echo .
echo Done dowloading files.
echo .
echo .
echo .
echo The next downloads will be optional, as you can insert these files yourself or you don't have the link now.
echo If you don't want to download (using a link you have) the preview and the video.wmv, close this.
echo Else, just press any key to continue the program:
pause
echo .
echo .
set /p "muslink=Enter the mus.mp3/preview link (it can be any filename, it will be renamed after): "
powershell -Command "Invoke-WebRequest %muslink% -Outfile mus.mp3"
set /p "videolink=Enter the video.wmv link (it can be any filename, it will be renamed after): "
powershell -Command "Invoke-WebRequest %videolink% -Outfile video/video.mp4"

echo Completed!
pause
echo The next step is to download the .CKD album coach from a just dance game, if you don't understand what this is, close this!
pause

set /p "aclink=Enter the albumcoach link (.ckd): "
powershell -Command "Invoke-WebRequest %aclink% -Outfile art/coach.ckd"
pause








cd ..\
::ckd2dds.bat
@echo off
cd bin
echo  Reading textures..
mkdir "..\%song%\art\tga.ckd" 2>NUL
move "..\%song%\art\*.ckd" "..\%song%\art\tga.ckd" 2>NUL
move "..\%song%\art\*.tmp" "..\%song%\art\tga.ckd" 2>NUL
move "..\%song%\art\*.dat" "..\%song%\art\tga.ckd" 2>NUL
move "..\%song%\art\*.ckd" "..\%song%\art\tga.ckd" 2>NUL
move "..\%song%\art\*.tmp" "..\%song%\art\tga.ckd" 2>NUL
move "..\%song%\art\*.dat" "..\%song%\art\tga.ckd" 2>NUL
mkdir "..\%song%\art\temp" 2>NUL
mkdir "..\%song%\art\temp\xtx" 2>NUL
mkdir "..\%song%\art\temp\gtx" 2>NUL
mkdir "..\%song%\art\temp\gtf" 2>NUL

quickbms -o "scriptCKDtoRAW.bms" "..\%song%\art\tga.ckd\*" "..\%song%\art\temp" 2>NUL
echo  Converting textures..
quickbms -o "scriptTGAtoDDS.bms" "..\%song%\art\temp\*" "..\%song%\art" 
::quickbms -o "scriptTGAtoXTX.bms" "..\%song%\art\temp\*" "..\%song%\art\temp\xtx" 2>NUL
::quickbms -o "scriptTGAtoGTX.bms" "..\%song%\art\temp\*" "..\%song%\art\temp\gtx" 2>NUL
::quickbms -o "scriptTGAtoGTF.bms" "..\%song%\art\temp\*" "..\%song%\art\temp\gtf" 2>NUL
for %%f in (../TGACKD_DDS/temp/xtx/*.xtx) do xtx_extract -o "../TGACKD_DDS/%%~nf.dds" "../TGACKD_DDS/temp/xtx/%%f" 
for %%f in (../TGACKD_DDS/temp/gtx/*.gtx) do texconv2 -i ../TGACKD_DDS/temp/gtx/%%f -o ../TGACKD_DDS/%%~nf.dds 
for %%f in (../TGACKD_DDS/temp/gtf/*.gtf) do gtf2dds.exe ../TGACKD_DDS/temp/gtf/%%f -o ../TGACKD_DDS/%%~nf.dds
rmdir "..\%song%\art\temp" /Q 2>NUL
del "..\%song%\art\temp" /Q







cd ..\
::resize.bat
@echo off
echo ODEX Song Resizer
echo by icebb
echo .
echo .
echo .
echo .
echo You need to install any version of https://www.imagemagick.org/script/download.php#windows
echo And then, create a shortcut in songs folder!
cd binMAGICK
echo . 
echo .
echo Resizing box.png
magick.exe convert "%CD%\%song%\art\box.jpg" -resize 129x129 "%CD%\%song%\art\box.png"
delete %CD%\%song%\art\box.jpg
echo Resizing coach.dds
magick.exe convert "%CD%\%song%\art\coach.dds" -resize 326x326 "%CD%\%song%\art\coach.png"
delete %CD%\%song%\art\coach.dds
echo Resizing 1.png
magick.exe convert "%CD%\%song%\player\1.png" -resize 256x256 "%CD%\%song%\player\1.png"
echo Resizing 2.png
magick.exe convert "%CD%\%song%\player\2.png" -resize 256x256 "%CD%\%song%\player\2.png"
echo Resizing 3.png
magick.exe convert "%CD%\%song%\player\3.png" -resize 256x256 "%CD%\%song%\player\3.png"
echo Resizing 4.png
magick.exe convert "%CD%\%song%\player\4.png" -resize 256x256 "%CD%\%song%\player\4.png"
pause

::ffmpeg -i %song%\video\video.mp4 -c:v wmv2 -b:v 1024k -c:a wmav2 -b:a 192k %song%\video\video.wmv