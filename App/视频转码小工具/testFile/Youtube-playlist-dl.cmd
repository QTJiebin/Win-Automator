@echo off &title Youtube-dl-�͹ܶ�������
::CODER BY pcysanji 2020-03-02

CD /D %~DP0 
color f1
SET PATH="%~dp0";"%~dp0App";%PATH%
MD Download
taskkill /IM RBTray.exe
ping -n 1 127.0.0.1 > nul
start /min RBTray.exe
:start
cls
echo.&echo.
echo -------------------------------------
echo.
echo.
Set /p URL=������ youtube ������Ƶ���Ӳ����س���
cls
echo.&echo.
:choseproxy
echo -------------------------------------
echo.
echo.
echo ���ô����б�
echo.&echo 	1. http://127.0.0.1:7890/ (clash)
echo.&echo 	2. socks5://127.0.0.1:1080/ (Shadowsocks)
echo.&echo 	3. http://127.0.0.1:10809/ (V2RayN)
echo.&echo 	4. ��ʹ�ô���
echo.
Set /p choseproxy=��ѡ���Ϸ��б��Ӧ��ţ������������ֶ��������
set proxy=%choseproxy%
if "%choseproxy%"=="1" set proxy=http://127.0.0.1:7890/
if "%choseproxy%"=="2" set proxy=socks5://127.0.0.1:1080/
if "%choseproxy%"=="3" set proxy=http://127.0.0.1:10809/
if "%choseproxy%"=="4" goto listdivider

:listdivider
echo "%URL%"|findstr "list" >nul
if %errorlevel% equ 0 (
	for /f "delims=& tokens=2" %%i in ("%URL%") do (
		set URL="https://www.youtube.com/playlist?%%i"
	)
	goto down
) else (
	goto down
)

cls
echo.
echo.
:down
echo 	���ؿ�ʼ...
ping -n 2 127.0.0.1 > nul
cls
echo.
echo.
echo 	�����У��ɡ��Ҽ�����С����ť����С��������������
echo.
echo.
youtube-dl.exe -i --cookies cookies.txt --proxy %proxy% --yes-playlist --socket-timeout 120 -R 12 -c  -o ".\Download\%%(upload_date)s-%%(title)s-%%(playlist_title)s-%%(resolution)s.%%(ext)s" %URL% --write-thumbnail --write-sub --write-auto-sub --sub-lang zh-Hans,zh-Hant,en
echo.
msg %username% /time:10 �������Ҳ��������ʧ�ܣ��뷵�ش��ڲ鿴�� BY 320ӡ�� 320nle.com
ECHO. &ECHO �������Ҳ��������ʧ�ܰ���������� &PAUSE >NUL 2>NUL
goto start