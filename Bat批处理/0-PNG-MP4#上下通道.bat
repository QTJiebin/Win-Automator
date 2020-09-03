@echo off & title ����֡ �� MP4 (����ͨ��) By Sengoku v1.5.2
REM ��Ҫ������ UnxUtils
REM �� output_rgb.mp4 output_alpha.mp4 images.txt �ļ��������ļ�����,���Բ������ж��
REM �޸��ո�·��,"%%i"�޷����ÿո�·��,���޸�Ϊ%%i(����˫����),%%~i(ɾ������),%%~fi(��չ��һ����ȫ�ϸ��·����)
REM ����ѭ��(*)Ϊ��ѡ���ļ���(%*),֡�����޸�
REM �޸���ż����
REM ����Ϊʹ���ļ���ִ��
REM -------------------------------------------------
REM ��λ����Ŀ¼
cd "%~dp1"
REM ����֡����
set fps=25
REM ��ʼѭ��
for /d %%i in (%*) do ( 
    REM �����嵥
    ufind "%%~i" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%%~i\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%%~i\images.txt"
    REM ת��rgb��Ƶ
    ffmpeg -r %fps% -f concat -safe 0 -i "%%~i\images.txt" -c:v libx264 -vf "scale=ceil(iw/2)*2:ceil(ih/2)*2" -r %fps% -pix_fmt yuv420p -an -y "%%~i\output_rgb.mp4"
    REM ת��alpha��Ƶ
    ffmpeg -r %fps% -f concat -safe 0 -i "%%~i\images.txt" -vf "[in] scale=ceil(iw/2)*2:ceil(ih/2)*2, format=rgba, split [T1], fifo, lutrgb=r=maxval:g=maxval:b=maxval,[T2] overlay [out]; [T1] fifo, lutrgb=r=minval:g=minval:b=minval [T2]" -an -y "%%~i\output_alpha.mp4"
    REM �ϲ���Ƶ
    ffmpeg -i "%%~i\output_rgb.mp4" -i "%%~i\output_alpha.mp4" -filter_complex vstack=inputs=2 -pix_fmt yuv420p -an -y "%%~i.mp4"
    REM �����ļ�
    del /q "%%~i\output_rgb.mp4" "%%~i\output_alpha.mp4" "%%~i\images.txt"
)
REM ѭ������
REM ɾ���嵥
rem del /q images.txt