@echo off &title ��Ƶת�빤���� By Sengoku v1.0
REM CODER BY Sengoku 2020-04-24

CD /D %~DP0
SET PATH="%~dp0";"%~dp0bin";%PATH%
MD output
if "%~1" == "" (
    echo �޷���ȡ�����ļ�·���������ԣ�������������Զ��رգ�
    ping /n 5 127.0.0.1 >nul
    Exit
  ) else (
    echo �ɹ���ȡ�����ļ�·����
    echo %*
)
:chosequality
echo -------------------------------------
echo ��Ƶת�빤����
echo.
echo.
echo ѡ��ת�����
echo.&echo 	1. ԭʼ�ֱ��� (�ߵ�����)
echo.&echo 	2. 1080P (�ߵ�����)
echo.&echo 	3. 720P (�е�����)
echo.&echo 	4. 480P (����ѹ��)
echo.&echo 	5. GIF���� (256ɫ)
echo.&echo 	6. ��ȡ��Ƶ��Ƶ (AAC��ʽ)
echo.
Set /p chosequality=��ѡ���Ϸ��б��Ӧ��ţ�
set quality=%chosequality%
if "%chosequality%"=="1" set quality=-c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(iw,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y
if "%chosequality%"=="2" set quality=-c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(1080,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y
if "%chosequality%"=="3" set quality=-c:v libx264 -preset 8 -x264opts crf=25.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(720,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y
if "%chosequality%"=="4" set quality=-c:v libx264 -preset 8 -x264opts crf=30:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(480,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y
if "%chosequality%"=="5" set quality=-vf "fps=25,scale=-2:360:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y
if "%chosequality%"=="6" set quality=-c:a copy -y
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

if "%chosequality%" LEQ "4" (
  for %%a in (%*) do ffmpeg.exe -i "%%~fa" %quality% ".\output\%%~na_x264.mp4"
  ) else (if "%chosequality%" == "5" (
      for %%a in (%*) do ffmpeg.exe -i "%%~fa" %quality% ".\output\%%~na.gif"
      ) else (
        if "%chosequality%" == "6" (
          for %%a in (%*) do ffmpeg.exe -i "%%~fa" -c:a copy -y ".\output\%%~na.aac"
          )
        ) 
)

REM if "%chosequality%" == "5" (
REM     for %%a in (%*) do ffmpeg.exe -i "%%~fa" %quality% ".\output\%%~na.gif"
REM   ) else (
REM     for %%a in (%*) do ffmpeg.exe -i "%%~fa" %quality% ".\output\%%~na_x264.mp4"
REM )


cls
echo.
msg %username% /time:5 ת�����Ҳ����ת��ʧ�ܣ��뷵�ش��ڲ鿴���ļ�������Ŀ¼�µ� output �ļ����С� BY Sengoku
ECHO. &ECHO ת�����Ҳ����ת��ʧ�ܡ������ڽ���������Զ��رա�
REM &PAUSE >NUL 2>NUL
ping /n 5 127.0.0.1 >nul
Exit
REM goto chosequality