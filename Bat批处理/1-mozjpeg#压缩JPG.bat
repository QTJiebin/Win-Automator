@echo off & title Mozjpeg ����ѹ�� JPG By Sengoku v1.0
cd /d %1
mkdir "mozjpeg"
for %%A in (*.jpg) do (
    echo %%A
    cjpeg -optimize -quality 70 -outfile "mozjpeg\%%A" "%%A"
)

