cd "%~dp1"
mkdir �ı�ֱ���
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:v libx264 -crf 23 -vf scale=iw/4:-2:flags=lanczos,setsar=1 -c:a copy -y "�ı�ֱ���\%%~na.mp4"

