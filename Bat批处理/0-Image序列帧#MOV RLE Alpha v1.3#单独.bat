@echo off & title ����֡ �� MOV RLE By Sengoku v1.3
REM Quicktime Animation
REM -------------------------------------------------
REM ��λ����Ŀ¼
cd "%~dp1"
REM �����嵥
ufind "%~1" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%~1\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%~1\images.txt"
REM ִ��ת��
REM ffmpeg -r 25 -f concat -safe 0 -i "%~1\images.txt" -c:v png -compression_level 100 -pred mixed -y "%~1_png.mov"
ffmpeg -r 25 -f concat -safe 0 -i "%~1\images.txt" -c:v qtrle -an -y "%~1_qtrle.mov"
REM ɾ���嵥
del /q "%~1\images.txt"