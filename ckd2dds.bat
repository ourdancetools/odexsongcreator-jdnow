@echo off
cd bin
set /p "song=Enter song number: "
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
pause
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
pause