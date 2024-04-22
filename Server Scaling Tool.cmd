@echo off
title DBLeS Server Scaling Tool
:home
cls
echo Welcome to the DBLeS Server Scaling Tool.
echo Created by Mohammed Sajid Abdullah
echo Please make sure you have doctl installed and initiated with digital Ocean token before running this Tool
echo //
echo 1. See Current Status
echo 2. Set $6 - Lowest
echo 3. Set $18 - Average
echo 4. Set $42 - High
echo 5. Exit

set /p choice="Enter your choice: "

if "%choice%"=="1" goto see_status
if "%choice%"=="2" goto set_$6
if "%choice%"=="3" goto set_$18
if "%choice%"=="4" goto set_$42
if "%choice%"=="5" exit /b

:see_status
cls
echo Reference Values:
echo Memory		VCPUs		Package
echo 4096		2		$42
echo 2048		2		$18
echo 1024		1		$6 	
echo //
echo Current Server Status:
doctl compute droplet get 387628641 --format "ID,Name,Memory,VCPUs"
pause
goto home

:set_$6
cls
echo Set to $6 Per Month (Loewst):
doctl compute droplet-action resize 387628641 --size s-1vcpu-1gb --resize-disk=false
doctl compute droplet-action power-on 387628641
pause
goto home

:set_$18
cls
echo Set to $18 Per Month (Medium):
doctl compute droplet-action resize 387628641 --size s-2vcpu-2gb --resize-disk=false
doctl compute droplet-action power-on 387628641
pause
goto home

:set_$42
cls
echo Set to $42 Per Month (High):
doctl compute droplet-action resize 387628641 --size c-2 --resize-disk=false
doctl compute droplet-action power-on 387628641
pause
goto home
