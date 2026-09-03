@echo off
setlocal

echo == Git status ==
git status --short
if errorlevel 1 exit /b %errorlevel%

echo.
echo == Diff check ==
git diff --check
if errorlevel 1 exit /b %errorlevel%

echo.
echo == Diff stat ==
git diff --stat
exit /b %errorlevel%
