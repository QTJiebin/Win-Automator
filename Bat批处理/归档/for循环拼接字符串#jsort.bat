@echo off & title forѭ��ƴ���ַ��� jsort ����

REM ������ʱ����
setlocal enabledelayedexpansion

set var=
REM ��ʼѭ��
REM findstr /r /i "png$ jpg$" ���� png �� jpg
for /f "delims=" %%i in ('dir /b /a-d %*^|findstr /r /i "png$ jpg$"^|jsort /n /i') do (
    echo "%%i"
    set var=!var!"%%i" 
)

echo ƴ�ӽ��:"%var%"
pause