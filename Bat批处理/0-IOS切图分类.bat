echo off & title IOS ��ͼ���� By Sengoku v1.2
REM -------------------------------------------------
REM ��λ����Ŀ¼
cd /d "%~dp1"
if exist "%~1\" (
  echo.
  echo "%~1" ���ļ���
  echo.
  echo ��λ���ļ���
  cd /d "%~1"
  echo.
  echo ��ʼ�����ļ�
  echo.
  call :check_file
  call :move_3x
  call :move_2x
  call :move_1x
  ) else (
    echo.
    echo "%~1" ���ļ�
    echo.
    echo ��λ���ļ�����Ŀ¼
    cd /d "%~dp1"
    echo.
    echo ��ʼ�����ļ�
    echo.
    call :check_file
    call :move_3x
    call :move_2x
    call :move_1x
)

:end
REM cls
echo.
REM msg %username% /time:2 IOS ��ͼ������ɡ� BY Sengoku
ECHO. &ECHO ��ͼ������ɡ��������Զ��رա�BY Sengoku
REM &PAUSE >NUL 2>NUL
REM ping /n 3 127.0.0.1 >nul
Exit

:check_file
REM �ж� @3x �ļ��Ƿ����
if exist "*@3x*.png" (
    REM ������� @3x.png �򴴽��ļ���
    echo "���� @3x �ļ���"
    md "@3x"
    echo.
    echo "��ʼ�ƶ� @3x"
    
    echo.
  ) else (
    REM �����ж� @3x.jpg �Ƿ����
    if exist "*@3x*.jpg" (
        REM ������� @3x.jpg �򴴽��ļ���
        echo "���� @3x �ļ���"
        md "@3x"
        echo.
        echo "��ʼ�ƶ� @3x"
        
        echo.
      ) else (
        REM �������򷵻�
        echo.
        echo "������ @3x �� PNG �� JPG �ļ�"
      )
)

REM �ж� @2x �ļ��Ƿ����
if exist "*@2x*.png" (
    REM ������� @2x.png �򴴽��ļ���
    echo "���� @2x �ļ���"
    md "@2x"
    echo.
    echo "��ʼ�ƶ� @2x"
    
    echo.
  ) else (
    REM �����ж� @2x.jpg �Ƿ����
    if exist "*@2x*.jpg" (
        REM ������� @2x.jpg �򴴽��ļ���
        echo "���� @2x �ļ���"
        md "@2x"
        echo.
        echo "��ʼ�ƶ� @2x"
        
        echo.
      ) else (
        REM �������򷵻�
        echo.
        echo "������ @2x �� PNG �� JPG �ļ�"
      )
)

REM �ж� @1x �ļ��Ƿ����
if exist "*.png" (
    REM ������� @1x.png �򴴽��ļ���
    echo "���� @1x �ļ���"
    md "@1x"
    echo.
    echo "��ʼ�ƶ� @1x"
    
    echo.
  ) else (
    REM �����ж� @1x.jpg �Ƿ����
    if exist "*.jpg" (
        REM ������� @1x.jpg �򴴽��ļ���
        echo "���� @1x �ļ���"
        md "@1x"
        echo.
        echo "��ʼ�ƶ� @1x"
        
        echo.
      ) else (
        REM �������򷵻�
        echo.
        echo "������ @1x �� PNG �� JPG �ļ�"
      )
)
echo �����ж�
goto :EOF

:move_3x
REM ����Ŀ¼������ @3x �� PNG �� JPG��ʹ�� xargs ���߳��ƶ��� @3x �ļ���
ufind "." -type f -iregex ".*@3x.*\(jpg\|jpeg\|png\)$" -maxdepth 1 -mindepth 1 -print0 | gxargs -0 -P 12 -I {} mv -f "{}" "@3x"
goto :EOF

:move_2x
REM ����Ŀ¼������ @2x �� PNG �� JPG��ʹ�� xargs ���߳��ƶ��� @2x �ļ���
ufind "." -type f -iregex ".*@2x.*\(jpg\|jpeg\|png\)$" -maxdepth 1 -mindepth 1 -print0 | gxargs -0 -P 12 -I {} mv -f "{}" "@2x"
goto :EOF

:move_1x
REM ����Ŀ¼������ @1x �� PNG �� JPG��ʹ�� xargs ���߳��ƶ��� @1x �ļ���
ufind "." -type f -iregex ".*\(jpg\|jpeg\|png\)$" -not -path "*@*x*" -maxdepth 1 -mindepth 1 -print0 | gxargs -0 -P 12 -I {} mv -f "{}" "@1x"
goto :EOF