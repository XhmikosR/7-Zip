@echo off
setlocal

cd /d %~dp0

rem add MSVC 64-bit in PATH
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

pushd CPP\7zip
nmake /f makefile NEW_COMPILER=1 MY_STATIC_LINK=1 CPU=AMD64
popd

:end
endlocal
rem pause
exit /b
