@echo off & title FFmpeg ����ת�� x264 (�Զ���) By Sengoku v1.1.3
REM �޸� Win ����·�� "%%~ni" ��Ϊ "%%~dpni"
REM ɾ��level=4.1
REM ��� -pix_fmt yuv420p ɫ�ʸ�ʽ����
REM ����Զ������
REM �޸�ƥ���(*.mp4;*.mov;*.flv;*.mkv;*.avi)Ϊ(%*),ƥ����ѡ����ļ�
set CRF=28
set /p CRF=������Ƶѹ������CRF,��Χ0-51,����Խ������ԽС,Ĭ��28:
set SIZE=720
set /p SIZE=������Ƶ�߶�,Ĭ��720p:
for %%i in (%*) do ffmpeg -i "%%~fi" -c:v libx264 -preset 8 -x264opts crf=%CRF%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%SIZE%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y "%%~dpni_x264_CRF%CRF%_%SIZE%p.mp4"