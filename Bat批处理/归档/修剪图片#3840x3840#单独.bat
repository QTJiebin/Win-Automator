@echo off & title ͼƬ�����޼� 3840x3840 (����) By Sengoku v1.0
cd "%~dp1"
magick "%~nx1" -crop 3840x3840 "%~n1.jpg"

