@echo off & title ����Ҽ�����
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

CD /D %~DP0\..\
SET binPATH="%~dp0bin"
SET servePATH="%~dp0serve"
REM echo %APPDATA%\Microsoft\Windows\SendTo
REM echo "%~DP0"
REM echo %UserProfile%
REM pause
:menu
cls
echo.&echo.
echo -------------------------------------
echo.
echo.
echo ��ѡ��
echo.
echo.  [1] ��װ����
echo.
echo.  [2] ɾ������
echo.
echo.  [X] �˳�
echo.
choice /C:12X /N /M  "��������ѡ�"

if errorlevel 3 exit
if errorlevel 2 goto :delete
if errorlevel 1 goto :startup

:startup
xcopy /e/f/y "%binPATH%" "%UserProfile%\bin\"
xcopy /e/f/y "%servePATH%" "%APPDATA%\Microsoft\Windows\SendTo"
echo ��ӳɹ�����������˳� &pause >NUL
exit

:delete
echo ɾ��Ŀ¼"%UserProfile%\bin"
rmdir /s/q "%UserProfile%\bin"
for %%i in (%servePATH%\*.bat) do ( del /f/s/q "%APPDATA%\Microsoft\Windows\SendTo\%%~nxi" )
echo ɾ���ɹ�����������˳�&pause >NUL
exit