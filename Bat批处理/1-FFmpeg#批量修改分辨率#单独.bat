::�޸ķֱ���(����) v1.2
 cd "%~dp1"
mkdir �ı�ֱ���
set videoSIZE=5760:2460
set videoSIZENAME=%videoSIZE::=x%
::echo %VAT%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf scale=%videoSIZE%:flags=lanczos,setsar=1 -c:a copy -y "�ı�ֱ���\%~n1_%videoSIZENAME%.mp4"
