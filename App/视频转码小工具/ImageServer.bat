@echo off &title ����֡ת����Ƶ By Sengoku v1.0
REM CODER BY Sengoku 2020-04-24

CD /D %~DP0
SET PATH="%UserProfile%\bin";"%~dp0bin";%PATH%
MD output
:start
cls
echo.&echo.
echo -------------------------------------
echo ��Ƶת�빤����
echo.
echo.
Set FliePATH=%1
Set FlieName=%~nx1
echo ������ļ���·����%FliePATH%
Set /p FliePATH=ֱ��ִ�л��������ļ��в��س���
cls
echo.&echo.
:check
echo -------------------------------------
echo ����ļ���·��
echo.
if exist %FliePATH%\ (
    echo ������׼��ת��...
    goto convert
  ) else (
    echo �Ƿ�·����������&PAUSE >NUL 2>NUL
    goto start
)
:convert
echo.
echo.
echo 	ת�뿪ʼ...
echo.
echo.
echo 	ת���У��ɡ��Ҽ�����С����ť����С��������������
echo.
echo.
REM CD /D "%FliePATH%"\
REM echo "%cd%"
for %%a in (%FliePATH%\*.png;%FliePATH%\*.jpg) do (
    echo file '%%a' >> "%FliePATH%\images.txt"
)
ffmpeg -r 25 -f concat -safe 0 -i "%FliePATH%\images.txt" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -pix_fmt yuv420p -an -y ".\output\%FlieName%.mp4"
del /q "%FliePATH%\images.txt"
cls
echo.
msg %username% /time:5 ת�����Ҳ����ת��ʧ�ܣ��뷵�ش��ڲ鿴���ļ�������Ŀ¼�µ� output �ļ����С� BY Sengoku
ECHO. &ECHO ת�����Ҳ����ת��ʧ�ܡ������ڽ���������Զ��رա�
REM &PAUSE >NUL 2>NUL
ping /n 5 127.0.0.1 >nul
Exit