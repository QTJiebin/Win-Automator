@echo off & title FFmpeg ��Ƶ����תΪ MOV By Sengoku v1.0
for %%a in (*.mp4) do ffmpeg -i "%%~fa" -codec copy "%%~na.mov"