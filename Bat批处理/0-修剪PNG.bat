@echo off & title �޼� PNG ͸������ By Sengoku v1.1
REM �޸�ƥ���(*.png)Ϊ(%*),ƥ����ѡ����ļ�
cd "%~dp1"
mkdir back
for %%a in (%*) do xcopy "%%~fa" "back" & magick "%%~fa" -trim "%%~na.png"