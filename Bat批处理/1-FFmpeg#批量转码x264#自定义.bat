@echo off & title FFmpeg 批量转码 x264 (自定义) By Sengoku v1.1.3
REM 修复 Win 搜索路径 "%%~ni" 改为 "%%~dpni"
REM 删除level=4.1
REM 添加 -pix_fmt yuv420p 色彩格式兼容
REM 添加自定义操作
REM 修改匹配符(*.mp4;*.mov;*.flv;*.mkv;*.avi)为(%*),匹配所选多个文件
set CRF=28
set /p CRF=输入视频压缩质量CRF,范围0-51,数字越大质量越小,默认28:
set SIZE=720
set /p SIZE=输入视频高度,默认720p:
for %%i in (%*) do ffmpeg -i "%%~fi" -c:v libx264 -preset 8 -x264opts crf=%CRF%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%SIZE%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y "%%~dpni_x264_CRF%CRF%_%SIZE%p.mp4"