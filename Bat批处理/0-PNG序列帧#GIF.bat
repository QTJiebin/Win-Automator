@echo off & title ����֡ �� GIF By Sengoku v1.2
REM ���֡������
REM ���ѭ��
REM ʹ��ͼ���ȡ���η�[640x640]����, -thumbnail 640x Ҳ����
REM -------------------------------------------------
REM ��λ����Ŀ¼
cd "%~dp1"
REM ����ѭ����0=����ѭ��
set loop=0
REM ����֡��
set fps=25
set /a delay=100/%fps%
REM ��ʼѭ��
for /d %%i in (%*) do (
    cd "%%~i"
    REM ִ��ת��
    magick -fuzz 1.6%% -delay %delay% -loop %loop% "*.png"[640x] -treedepth 4 -layers OptimizePlus -layers OptimizeTransparency "out.gif"
    REM ѹ��
    gifsicle -O3 --lossy=80 --colors 256 --resize-touch 640x_ "out.gif" -o "%%~i.gif"

    REM ɾ��
    del /q "out.gif"
)
REM ѭ������