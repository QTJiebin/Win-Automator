@echo off & title FFmpeg ��Ƶ��Ƶ��Ⱦ��� By Sengoku v1.0
for %%a in (*.mp4) do ffmpeg -i "%%~fa" -c:v copy -filter:a "loudnorm" "%%~na_loudnorm.mp4"
pause