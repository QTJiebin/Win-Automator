::�޸Ļ����ߴ�(����) v1.3
REM ����ֶ����뻭���ߴ�
cd "%~dp1"
set videoSIZENAME=1920x1080
set /p videoSIZENAME=������Ƶ�����ߴ�,Ĭ��1920x1080�����ߴ�:
set videoSIZE=%videoSIZENAME:x=:%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf "scale=%videoSIZE%:flags=lanczos:force_original_aspect_ratio=decrease,setsar=1,pad=%videoSIZE%:(ow-iw)/2:(oh-ih)/2" -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
