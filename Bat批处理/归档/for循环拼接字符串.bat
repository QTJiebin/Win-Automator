@echo off & title forѭ��ƴ���ַ���

REM ������ʱ����
setlocal enabledelayedexpansion

set var=
REM ��ʼѭ��
for %%i in (path\*.png) do (
    echo "%%i"
    set var=!var! "%%i"
)

echo ƴ�ӽ��:"%var%"
pause