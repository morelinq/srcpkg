@echo off
pushd "%~dp0"
call :main %*
popd
goto :EOF

:main
setlocal
chcp 1252 > nul
for %%i in (NuGet.exe) do set nuget=%%~dpnx$PATH:i
if "%nuget%"=="" goto :nonuget
if not exist dist md dist
if not %errorlevel%==0 exit /b %errorlevel%
for %%i in (pkg\MoreLinq.Source.*.nuspec) do nuget pack %%i -OutputDirectory dist || exit /b 1
goto :EOF

:nonuget
echo NuGet executable not found in PATH
echo To download a version, see https://dist.nuget.org/
exit /b 2
