rem 1. In order to use this correctly, the newest update must be in \\172.22.16.10\transfer\SystemUpdates\dts
rem    Please still copy the update folder into that directory as well
rem 2. Copy this file to the path on the pc where you want to update mcis 
net use m: /persistent:yes  \\172.22.16.10\transfer\SystemUpdates\dts
copy dts.exe m:
net use m: /d
rem uncomment the line below if you are doing a new install 
rem copy m:\gds32.dll .
pause