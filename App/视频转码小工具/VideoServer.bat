@echo off &title ��Ƶת�빤���� By Sengoku v1.1
REM CODER BY Sengoku 2020-04-29
REM �Ż�����,����Զ����������

CD /D %~DP0
SET PATH="%~dp0";"%~dp0bin";%PATH%
MD output
if exist "%~dp0\bin\ffmpeg.exe" (
    echo ��ʼ��������
  ) else (
    echo �Ҳ���������,�����°�װ��������������Զ��رգ�
    ping /n 5 127.0.0.1 >nul
    Exit
)
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
echo.&echo 	5. �Զ��� (���ʺͷֱ���)
echo.&echo 	6. GIF���� (256ɫ)
echo.&echo 	7. ��ȡ��Ƶ��Ƶ (AAC��ʽ)
echo.
Set /p chosequality=��ѡ���Ϸ��б��Ӧ��ţ�
REM set quality=%chosequality%
if "%chosequality%"=="1" (
    set quality=23.5
    set resize=iw
)
if "%chosequality%"=="2" (
    set quality=23.5
    set resize=1080
)
if "%chosequality%"=="3" (
    set quality=25.5
    set resize=720
)
if "%chosequality%"=="4" (
    set quality=30
    set resize=480
)
if "%chosequality%"=="5" (
    set quality=28
    set resize=720
)
if "%chosequality%"=="6" set quality=6
if "%chosequality%"=="7" set quality=7
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
    for %%a in (%*) do (
    ffmpeg.exe -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=%quality%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%resize%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y ".\output\%%~na_x264.mp4"
  )
  goto :end
)
if "%chosequality%" == "5" (
    call :setting
    for %%a in (%*) do (
    ffmpeg.exe -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=%quality%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%resize%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y ".\output\%%~na_x264_CRF%quality%_%resize%p.mp4"
  )
)
if "%chosequality%" == "6" (
    for %%a in (%*) do ffmpeg.exe -i "%%~fa" -vf "fps=25,scale=-2:360:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y ".\output\%%~na.gif"
)
if "%chosequality%" == "7" (
    for %%a in (%*) do ffmpeg.exe -i "%%~fa" -c:a copy -y ".\output\%%~na.aac"
)

:end
cls
echo.
msg %username% /time:3 ת�����Ҳ����ת��ʧ�ܣ��뷵�ش��ڲ鿴���ļ�������Ŀ¼�µ� output �ļ����С� BY Sengoku
ECHO. &ECHO ת�����Ҳ����ת��ʧ�ܡ������ڽ���������Զ��رա�
REM &PAUSE >NUL 2>NUL
ping /n 3 127.0.0.1 >nul
Exit
REM goto chosequality

:setting
cls
echo.
echo �������ʲ���
echo ������0-51������(����Խ������Խ��)
echo �����Ϻ���ķ�Χ��:17-28��Ĭ��ֵ:28
echo.
set /p quality=�������ʻ�ֱ�ӻس���
cls
echo.
echo ������Ƶ�߶ȣ��������Ӧ��Ĭ��ֵ720
echo.
set /p resize=����߶Ȼ�ֱ�ӻس���
GOTO :EOF