@echo off & title GIF ѹ�� (720P) By Sengoku v1.1
REM ����Զ������
REM �޸�ƥ���(*.gif)Ϊ(%*),ƥ����ѡ����ļ�
cd "%~dp1"
set size=720
set /p size=����ֱ��ʣ�Ĭ��720:
set colors=256
set /p colors=�����ɫ�壬Ĭ��256:
set lossyGIF=80
set /p lossy=����������Ĭ��80:

for %%a in (%*) do (
    gifsicle --resize-fit-height %size% -O3 --delay=8 --lossy=%lossyGIF% --colors %colors% "%%~fa" -o "%%~na_%size%_lossy%lossyGIF%.gif"
)