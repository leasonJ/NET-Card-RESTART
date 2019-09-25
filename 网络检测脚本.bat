@echo off
:begin
echo "网卡检测..."
timeout /t 30
ping 10.50.0.22 -n 1
rem echo %errorlevel%
if %errorlevel% == 0 goto begin
else if %errorlevel% == 1 goto reboot

:reboot
echo "网卡重启..."
echo "网卡停用中..."
netsh interface set interface "本地连接" disabled
timeout /t 20
echo "网卡启动中..."
netsh interface set interface "本地连接" enabled
timeout /t 120
goto begin