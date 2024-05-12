@echo off
del bootpayload.bin
del os.nb
del RUU_Unsigned.nbh
del lk.bin
echo "Please copy bootpayload.bin to this directory and press enter"
pause
move lk.bin bootpayload.bin
.\BINInsert.exe -N .\bootpayload.bin .\os.nb.old bootshim.nk.new
.\BINInsert.exe -I .\zeroos.bin .\bootshim.nk.new os.nb
.\nbhTool.exe .\hd7.txt
.\HD7_RUUWrapper_00.exe