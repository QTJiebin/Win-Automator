@echo off &title Rclone ͬ�� SendTo �� onedrive By Sengoku v1.1
REM ���ô���
set http_proxy=socks5://127.0.0.1:1080
set https_proxy=socks5://127.0.0.1:1080
set http_proxy=http://127.0.0.1:1081
set https_proxy=http://127.0.0.1:1081
REM ��ʼͬ�� SendTo
rclone sync "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\SendTo" onedrive:"�Զ���\Windows �ű�\SendTo" -P --log-file="C:\Users\Administrator\Rclone_win.log" --include *.{bat}

REM ���� results
rclone copy onedrive:"Windows ���\stairspeedtest_reborn_win64\results" onedrive:"��ѧ����\����ͼ" -P --log-file="C:\Users\Administrator\Rclone_win.log" --include *.{png,jpg}

REM ͬ�� scoop
REM ��ѹ��һ��
cd "C:\Users\Administrator"
7z a scoop.zip scoop\
rclone copy "C:\Users\Administrator\scoop.zip" onedrive:"���ؿ�\bin" -P --log-file="C:\Users\Administrator\Rclone_win.log"

msg %username% /time:2 Rclone ͬ�����Ҳ����ͬ��ʧ�ܡ���־�������û�Ŀ¼�¡� BY Sengoku