@echo off & title ͼƬȥ����ɫ By Sengoku v1.1
REM �޸�ƥ���(*.jpg)Ϊ(%*),ƥ����ѡ����ļ�
cd "%~dp1"
for %%a in (%*) do magick "%%~fa" -fuzz 20%% -transparent white "%%~na_unmult.png"