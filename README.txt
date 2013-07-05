Installation on Client PCs

You can either 

a) install interbase on the PC or 
b) copy gds32.dll into the directory with dts.exe and add the following line to C:\Windows\System32\drivers\etc\services

gds_db           3050/tcp


Be sure to copy update-dts.bat to your directory as well for one-click updating.