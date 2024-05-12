@echo off
del bootpayload.bin
del os.nb
del RUU_Unsigned.nbh
del lk.bin
echo "Please copy bootpayload.bin to this directory and press enter"
pause
move lk.bin bootpayload.bin
rem replace NK.bin with our bootpayload
.\BINInsert.exe -N .\bootpayload.bin .\os.nb.old bootshim.nk.new
rem replace the OS image in IMGFS with just one zero to make the nbh smaller
.\BINInsert.exe -I .\zeroos.bin .\bootshim.nk.new os.nb
rem create the unsigned nbh hspl is needed to flash it
.\nbhTool.exe .\hd7.txt
rem start the installer
.\HD7_RUUWrapper_00.exe
