chcp 65001>NUL
@echo off & title 图片批量添加水印 By Sengoku v1.0
for /r %%i in (*.jpg;*.png) do (
    magick "%%i" -font "SourceHanSansCN-Medium.otf" -pointsize 240 -fill black -weight bolder -gravity Center -annotate 0 @"txt.txt" "%%~dpni_txt%%~xi"
)
pause