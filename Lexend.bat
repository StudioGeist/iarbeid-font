@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set "BASE_URL=https://raw.githubusercontent.com/StudioGeist/iarbeid-font/main/Lexend"
set "TEMP_DIR=%TEMP%\LexendFonts"
mkdir "%TEMP_DIR%" 2>nul

echo Laster ned Lexend...
for %%W in (Thin ExtraLight Light Regular Medium SemiBold Bold ExtraBold Black) do (
    echo  - Lexend-%%W.ttf
    powershell -Command "Invoke-WebRequest -Uri '%BASE_URL%/Lexend-%%W.ttf' -OutFile '%TEMP_DIR%\Lexend-%%W.ttf'"
)

echo.
echo Installerer skrifter...
for %%W in (Thin ExtraLight Light Regular Medium SemiBold Bold ExtraBold Black) do (
    if exist "%TEMP_DIR%\Lexend-%%W.ttf" (
        copy /Y "%TEMP_DIR%\Lexend-%%W.ttf" "%WINDIR%\Fonts\Lexend-%%W.ttf" >nul
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Lexend %%W (TrueType)" /t REG_SZ /d "Lexend-%%W.ttf" /f >nul
    ) else (
        echo MANGLER: %%W.ttf
    )
)

rmdir /S /Q "%TEMP_DIR%"

echo.
echo Ferdig! Alle Lexend-vektene er installert.
pause