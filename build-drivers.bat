@echo off
setlocal

:: cd /d d:\dev\git\zlaski\Windows-driver-samples & build-drivers
:: pskill pwsh & pskill msbuild & pskill stampinf & pskill inf2cat

pushd %~dp0
chcp 10000

:: reg delete HKCU\SOFTWARE\Akisystems\AKIBLD\VSConfig /f

if not defined UCRTVersion set "UCRTVersion=10.0.22621.0"

:: set WDS_Configuration='Debug'
:: set WDS_Platform='x64'
run-pwsh-script Build-AllSamples.ps1 -Samples "^network." -Configurations "Debug" -Platforms "x64" -Verbose

popd
