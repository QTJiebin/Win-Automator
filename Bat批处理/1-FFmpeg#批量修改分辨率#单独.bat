@echo off & title FFmpeg ��Ƶ�޸ķֱ��� (����) By Sengoku v1.3
REM ����ֶ�����ֱ���
cd "%~dp1"
REM mkdir �ı�ֱ���
set /p videoSIZENAME=������Ƶ�ߴ�,��1920x1080:
set videoSIZE=%videoSIZENAME:x=:%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf scale=%videoSIZE%:flags=lanczos,setsar=1 -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
