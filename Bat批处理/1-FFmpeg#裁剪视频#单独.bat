@echo off & title FFmpeg ��Ƶ�ü� (����) By Sengoku v1.3
REM ����ֶ�����ֱ���
cd "%~dp1"
set videoSIZENAME=1920x1080
set /p videoSIZENAME=������Ƶ�ߴ�,Ĭ��1920x1080�ֱ���:
set videoSIZE=%videoSIZENAME:x=:%
ffmpeg -i "%~nx1" -c:v libx264 -crf 18 -vf "crop=%videoSIZE%" -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
