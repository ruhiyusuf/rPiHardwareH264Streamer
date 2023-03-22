:loop
.\netcat\nc.exe -ul -p5802 -w 2 | .\netcat\nc.exe | .\MPlayer\mplayer.exe -fps 90 -demuxer h264es -cache 512 -
goto loop