@echo off & title ͼƬתΪ PDF (ʱ������) By Sengoku v2.0
REM ��Ҫ python img2pdf jsort.bat

REM ������ʱ����
setlocal enabledelayedexpansion

REM ��λ��Ŀ¼
cd "%~dp1"

REM ��ȡʱ��
set hour=%time:~,2%
if "%time:~,1%"==" " set hour=0%time:~1,1%
REM echo %date:~0,4%%date:~5,2%%date:~8,2%%hour%%time:~3,2%%time:~6,2%
set imageTime=%date:~0,4%-%date:~5,2%-%date:~8,2%-%hour%%time:~3,2%%time:~6,2%

REM ����·��
set image_path=
REM ��ʼѭ��
for /f "delims=" %%i in ('dir /b /a-d %*^|findstr /r /i "png$ jpg$"^|jsort /n /i') do (
    set image_path=!image_path!"%%~nxi" 
)
echo �ļ��嵥: %image_path%

REM ��ʼת��
echo.
echo ���ڽ�ͼƬת��Ϊ PDF
echo.
img2pdf %image_path% -o "%~dp1PDF-%imageTime%.pdf"