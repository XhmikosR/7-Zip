@echo off
setlocal

cd /d %~dp0

rem add MSVC in PATH
call :SubVSPath
if not exist "%VS_PATH%" echo ERROR: Visual Studio 2019 NOT FOUND! & goto end

call "%VS_PATH%\Common7\Tools\vsdevcmd" -arch=amd64

pushd CPP\7zip
nmake /f makefile NEW_COMPILER=1 MY_STATIC_LINK=1 CPU=AMD64
popd

:end
endlocal
if not defined CI pause
exit /b

:SubVSPath
for /f "delims=" %%A in ('"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -property installationPath -latest -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64') do set "VS_PATH=%%A"
exit /b
