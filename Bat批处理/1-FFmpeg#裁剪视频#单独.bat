::�޸ķֱ���(����) v1.2
 cd "%~dp1"
mkdir �ı�ֱ���
set videoSIZE=1600:900
set videoSIZENAME=%videoSIZE::=x%
::echo %VAT%
ffmpeg -i "%~nx1" -c:v libx264 -crf 18 -vf "crop=%videoSIZE%" -c:a copy -y "�ı�ֱ���\%~n1_%videoSIZENAME%.mp4"
