@echo off & title rush ���Խű� By Sengoku v1.0
setlocal enabledelayedexpansion
set str=
for %%i in (%*) do (set str=!str! %%i)
::echo !str!
ufind !str!
pause