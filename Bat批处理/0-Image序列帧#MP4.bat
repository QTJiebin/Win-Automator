@echo off & title ����֡ �� MP4 By Sengoku v1.5.2
REM ��Ҫ������ UnxUtils
REM �� images.txt �ļ��������ļ�����,���Բ������ж��
REM �޸��ո�·��,"%%i"�޷����ÿո�·��,���޸�Ϊ%%i(����˫����),%%~i(ɾ������),%%~fi(��չ��һ����ȫ�ϸ��·����)
REM ����ѭ��(*)Ϊ��ѡ���ļ���(%*),֡�����޸�
REM �޸���ż����&��͸������
REM ����Ϊʹ���ļ���ִ��
REM -------------------------------------------------
REM ��λ����Ŀ¼
cd "%~dp1"
REM ����֡����
set fps=25
REM ��ʼѭ��
for /d %%i in (%*) do ( 
    REM �����嵥
    ufind "%%~i" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%%~i\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%%~i\images.txt"
    REM ִ��ת��
    ffmpeg -r %fps% -f concat -safe 0 -i "%%~i\images.txt" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -filter_complex "color=black,format=rgb24,fps=fps=%fps%[c];[c][0]scale2ref[c][i];[c][i]overlay=format=auto:shortest=1,setsar=1,pad=ceil(iw/2)*2:ceil(ih/2)*2" -r %fps% -pix_fmt yuv420p -an -y "%%~i.mp4"
    REM ɾ���嵥
    del /q "%%~i\images.txt"
)
REM ѭ������