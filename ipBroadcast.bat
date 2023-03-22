:loop
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Network IP: %NetworkIP%
echo %NetworkIP% | ncat -u 255.255.255.255 5803
goto loop
pause
