:: FFmpeg����ת��x264 720P v1.1.2
:: ɾ��level=4.1
:: ��� -pix_fmt yuv420p ɫ�ʸ�ʽ����
:: ����Զ������
:: �޸�ƥ���(*.mp4;*.mov;*.flv;*.mkv;*.avi)Ϊ(%*),ƥ����ѡ����ļ�
set CRF=28
set /p CRF=������Ƶѹ������CRF,��Χ0-51,����Խ������ԽС,Ĭ��28:
set SIZE=720
set /p SIZE=������Ƶ�߶�,Ĭ��720p:
for %%a in (%*) do ffmpeg -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=%CRF%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%SIZE%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y "%%~na_x264_CRF%CRF%_%SIZE%p.mp4"