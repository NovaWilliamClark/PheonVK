@echo off
setlocal EnableDelayedExpansion

REM Initialize module status
set "Engine=Not Selected"
set "Editor=Not Selected"
set "Sandbox=Not Selected"

:menu
cls
echo Please toggle the modules you want to build:
echo.
echo [E] Engine       [%Engine%]
echo [D] Editor       [%Editor%]
echo [S] Sandbox      [%Sandbox%]
echo [A] All
echo [N] None
echo [B] Build
echo.

set /p choice=Select an option (E, D, S, A, N, B): 

if /I "!choice!"=="E" (
    if "!Engine!"=="Selected" (
        set "Engine=Not Selected"
    ) else (
        set "Engine=Selected"
    )
)

if /I "!choice!"=="D" (
    if "!Editor!"=="Selected" (
        set "Editor=Not Selected"
    ) else (
        set "Editor=Selected"
    )
)

if /I "!choice!"=="S" (
    if "!Sandbox!"=="Selected" (
        set "Sandbox=Not Selected"
    ) else (
        set "Sandbox=Selected"
    )
)

if /I "!choice!"=="A" (
    set "Engine=Selected"
    set "Editor=Selected"
    set "Sandbox=Selected"
)

if /I "!choice!"=="N" (
    set "Engine=Not Selected"
    set "Editor=Not Selected"
    set "Sandbox=Not Selected"
)

if /I "!choice!"=="B" goto build
goto menu

:build
set "BUILD_OPTIONS="
if "!Engine!"=="Selected" set "BUILD_OPTIONS=--with-engine "
if "!Editor!"=="Selected" set "BUILD_OPTIONS=!BUILD_OPTIONS!--with-editor "
if "!Sandbox!"=="Selected" set "BUILD_OPTIONS=!BUILD_OPTIONS!--with-sandbox"

if defined BUILD_OPTIONS (
    echo Building with options: !BUILD_OPTIONS!
    REM Here you would invoke your build command, e.g., calling premake or make
    pushd ..
    third_party\premake\bin\windows\premake5.exe !BUILD_OPTIONS! --file=premake5.lua vs2022
    popd
) else (
    echo No modules selected for building.
)

pause
