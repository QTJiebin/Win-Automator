@echo off & title ����֡ �� GIF By Sengoku v1.1
REM ���ѭ��
REM ʹ��ͼ���ȡ���η�[640x640]����, -thumbnail 640x Ҳ����
REM -------------------------------------------------
REM ��λ����Ŀ¼
cd "%~dp1"
REM ����ѭ����0=����ѭ��
set loop=0
REM ��ʼѭ��
for /d %%i in (%*) do (
    cd "%%~i"
    REM ִ��ת��
    timecmd magick -fuzz 1.6%% -delay 4 -loop %loop% "*.png"[640x] -treedepth 4 -layers OptimizePlus -layers OptimizeTransparency "out.gif"
    REM ѹ��
    timecmd gifsicle -O3 --lossy=80 --colors 256 --resize-touch 640x_ "out.gif" -o "%%~i.gif"

    REM ɾ��
    del /q "out.gif"
)
REM ѭ������