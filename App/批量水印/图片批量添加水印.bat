chcp 65001>NUL
@echo off & title ͼƬ�������ˮӡ By Sengoku v1.0
for /r %%i in (*.jpg;*.png) do (
    magick "%%i" -font "font.otf" -pointsize 240 -fill black -weight bolder -gravity Center -annotate 0 @"text.txt" "%%~dpni_txt%%~xi"
)
pause