@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ROOT=%~1"
if "%ROOT%"=="" set "ROOT=."

if not exist "%ROOT%" (
    echo Fehler: Verzeichnis "%ROOT%" existiert nicht. 1>&2
    exit /b 1
)

echo # Projektinventur
echo.
echo Root: %ROOT%
echo.

set /a TOTAL=0
for /r "%ROOT%" %%F in (*) do (
    echo %%~fF | findstr /i /c:"\.git\" /c:"\bin\" /c:"\obj\" >nul
    if errorlevel 1 set /a TOTAL+=1
)

echo Dateien gesamt: !TOTAL!
echo.
echo Hinweis: Fuer detaillierte Dateityp- und Groessenstatistiken eignet sich die PowerShell-
echo oder Python-Variante besser. Dieses Batch-Beispiel bleibt absichtlich klein und lesbar.

endlocal
