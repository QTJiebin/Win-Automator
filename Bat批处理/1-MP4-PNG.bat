@echo off & title MP4 �� PNG ����֡ By Sengoku v1.1
REM �����ļ�������
REM �޸�ƥ���(*.mp4)Ϊ(%*),ƥ����ѡ�ļ�
cd "%~dp1"
for %%a in (%*) do mkdir "%%~na" & ffmpeg -i "%%~fa" "%%~na\%%~na_%%06d.png"
