@echo off
cd /d "%~dp0"
set "HOST=127.0.0.1"
set "PORT=8001"
for /f "usebackq tokens=2 delims==" %%a in (`findstr /b /c:"HOST=" .env`) do set "HOST=%%a"
for /f "usebackq tokens=2 delims==" %%a in (`findstr /b /c:"PORT=" .env`) do set "PORT=%%a"
echo.
echo ============================================================
echo   Starting Perennia on http://%HOST%:%PORT%
echo   Admin panel: http://%HOST%:%PORT%/admin
echo   Press Ctrl+C to stop the server.
echo ============================================================
echo.
"%~dp0venv\Scripts\python.exe" -m uvicorn app.main:app --host %HOST% --port %PORT%
pause
