@echo off & title ����ѹ��ͼƬ By Sengoku v1.1
REM ��� GIF ֧��
REM CODER BY Sengoku 2020-07-31

CD /D %~DP0
SET PATH="%UserProfile%\bin";"%~dp0bin";%PATH%
MD output
if exist "%UserProfile%\bin\pngquant.exe" (
    echo ��ʼ�� PNG ������%UserProfile%
  ) else (
      if exist "%~dp0\bin\pngquant.exe" (
        echo ��ʼ�� PNG ������%~dp0
        ) else (
            echo �Ҳ��� PNG ������,�����°�װ��������������Զ��رգ�
            ping /n 5 127.0.0.1 >nul
            Exit
            )
)
if exist "%UserProfile%\bin\cjpeg.exe" (
    echo ��ʼ�� JPG ������%UserProfile%
  ) else (
      if exist "%~dp0\bin\cjpeg.exe" (
        echo ��ʼ�� JPG ������%~dp0
        ) else (
            echo �Ҳ��� JPG ������,�����°�װ��������������Զ��رգ�
            ping /n 5 127.0.0.1 >nul
            Exit
            )
)
if exist "%UserProfile%\bin\gifsicle.exe" (
    echo ��ʼ�� GIF ������%UserProfile%
  ) else (
      if exist "%~dp0\bin\gifsicle.exe" (
        echo ��ʼ�� GIF ������%~dp0
        ) else (
            echo �Ҳ��� GIF ������,�����°�װ��������������Զ��رգ�
            ping /n 5 127.0.0.1 >nul
            Exit
            )
)

:start
cls
echo.&echo.
echo -------------------------------------
echo ����ѹ��ͼƬ
echo.
echo.
set FliePATH=%1
set FlieName=%~nx1
echo ������ļ���·����%FliePATH%
set /p FliePATH=ֱ��ִ�л��������ļ��в��س���
cls
echo.&echo.

:check
echo -------------------------------------
echo ����ļ���·��
echo.
if exist %FliePATH%\ (
    echo ������׼��ת��...
    goto chosequality
  ) else (
    echo �Ƿ�·����������&PAUSE >NUL 2>NUL
    goto start
)

:chosequality
echo -------------------------------------
echo ����ѹ��ͼƬ
echo.
echo.
echo ѡ��ѹ������
echo.&echo 	1.  256ɫ (�ߵ�����)
echo.&echo 	2.  256ɫ (�е�����)
echo.&echo 	3.  128ɫ (�е�����)
echo.&echo 	4.  �ֶ��������
echo.
set /p chosequality=��ѡ���Ϸ��б��Ӧ��ţ�
REM set quality=%chosequality%
if "%chosequality%"=="1" (
    set qualityPNG=70-85
    set color=256
    set qualityJPG=80
    set qualityGIF=80
)
if "%chosequality%"=="2" (
    set qualityPNG=45-65
    set color=256
    set qualityJPG=65
    set qualityGIF=65
)
if "%chosequality%"=="3" (
    set qualityPNG=45-65
    set color=128
    set qualityJPG=65
    set qualityGIF=65
)
if "%chosequality%"=="4" (
    set qualityPNG=70-85
    echo.&echo ���� PNG ������Χ
    echo.&echo ����0������100��������֮�������
    echo.&echo Ĭ�� 70-85
    set /p qualityPNG=������������Χ��
    set color=256
    echo.&echo �����ɫ����ֵ
    echo.&echo ���� 8 �� 256 ��������ɫ��֮�������
    echo.&echo Ĭ�� 256
    set /p color=������ɫ�巶Χ��
    set qualityJPG=80
    set /p qualityJPG=������ JPG ������Χ��
    set qualityGIF=80
    set /p qualityGIF=������ GIF ������Χ��
)
cls
echo.
echo.

:convert
echo 	ѹ����ʼ...
cls
echo.
echo.
echo 	ѹ���У��ɡ��Ҽ�����С����ť����С��������������
echo.
echo.

if "%chosequality%" LEQ "5" (
  for %%a in (%FliePATH%\*.png) do (
    pngquant %color% --ext=.png --force --verbose --quality=%qualityPNG% --strip --speed 1 --skip-if-larger - < "%%~fa" > ".\output\%%~na.png"
  )
  for %%a in (%FliePATH%\*.jpg;%FliePATH%\*.jpeg) do (
    cjpeg -optimize -quality %qualityJPG% -outfile ".\output\%%~nxa" "%%~fa"
  )
  for %%a in (%FliePATH%\*.gif) do (
    gifsicle -O3 --lossy=%qualityGIF% --colors %color% "%%~fa" -o ".\output\%%~nxa"
  )
  goto :end
)

:end
cls
echo.
msg %username% /time:3 ѹ�����Ҳ����ѹ��ʧ�ܣ��뷵�ش��ڲ鿴���ļ�������Ŀ¼�µ� output �ļ����С� BY Sengoku
ECHO. &ECHO ѹ�����Ҳ����ѹ��ʧ�ܡ������ڽ���������Զ��رա�
REM &PAUSE >NUL 2>NUL
ping /n 3 127.0.0.1 >nul
Exit