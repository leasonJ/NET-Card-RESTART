@echo off
:begin
echo "�������..."
timeout /t 30
ping 10.50.0.22 -n 1
rem echo %errorlevel%
if %errorlevel% == 0 goto begin
else if %errorlevel% == 1 goto reboot

:reboot
echo "��������..."
echo "����ͣ����..."
netsh interface set interface "��������" disabled
timeout /t 20
echo "����������..."
netsh interface set interface "��������" enabled
timeout /t 120
goto begin