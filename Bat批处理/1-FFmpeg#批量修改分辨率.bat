@echo off & title FFmpeg �����޸ķֱ��� By Sengoku v1.3
REM ����ֶ�����ֱ���
cd "%~dp1"
REM mkdir �ı�ֱ���
set /p videoSIZENAME=������Ƶ�ߴ�,��1920x1080:
set videoSIZE=%videoSIZENAME:x=:%
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:v libx264 -crf 23 -vf scale=%videoSIZE%:flags=lanczos,setsar=1 -c:a copy -y "%%~na_%videoSIZENAME%.mp4"

