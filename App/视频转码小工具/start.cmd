@echo off &title ffpegת�����
REM CODER BY Sengoku 2020-04-21

CD /D %~DP0 
REM color f1
SET PATH="%~dp0";"%~dp0bin";%PATH%
MD output
REM taskkill /IM ffmpeg.exe
REM start /min ffmpeg.exe
:start
cls
echo.&echo.
echo -------------------------------------
echo ��Ƶת�빤����
echo.
echo.
Set FliePATH=%1
echo ������ļ�·����%FliePATH%
Set /p FliePATH=ֱ��ִ�л�������(��Ƶ�ļ�^|�ļ���)���س���
cls
echo.&echo.
:chosequality
echo -------------------------------------
echo.
echo.
echo ���ô����б�
echo.&echo 	1. ԭʼ�ֱ��� (�ߵ�����)
echo.&echo 	2. 1080P (�е�����)
echo.&echo 	3. 720P (�͵�����)
echo.&echo 	4. 480P (����ѹ��)
echo.
Set /p chosequality=��ѡ���Ϸ��б��Ӧ��ţ�
set quality=%chosequality%
if "%chosequality%"=="1" set quality=crf=28:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(1080,ih)':flags=lanczos" -pix_fmt yuv420p
if "%chosequality%"=="2" set quality=socks5://127.0.0.1:1080/
if "%chosequality%"=="3" set quality=http://127.0.0.1:10809/
if "%chosequality%"=="4" set quality=http://127.0.0.1:10809/
cls
echo.
echo.
:convert
echo 	ת�뿪ʼ...
cls
echo.
echo.
echo 	ת���У��ɡ��Ҽ�����С����ť����С��������������
echo.
echo.
REM ffmpeg.exe -i %FliePATH% -c:v libx264 -preset 8 -x264opts %quality% -c:a aac -b:a 128k -ar 44100 -y ".\output\test.mp4"
if exist %FliePATH%\ (
    echo test ���ļ���
) else (
    echo test ���ļ�
)
pause
echo.
msg %username% /time:5 ת�����Ҳ����ת��ʧ�ܣ��뷵�ش��ڲ鿴���ļ�������Ŀ¼�µ� output �ļ����С� BY Sengoku
ECHO. &ECHO �������Ҳ��������ʧ�ܰ���������� &PAUSE >NUL 2>NUL
goto start