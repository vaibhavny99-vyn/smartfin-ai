@echo off
echo Starting SmartFin AI...

cd /d "%~dp0"

REM Start Backend
echo Starting Backend (FastAPI)...
start "SmartFin AI Backend" cmd /k "cd backend && call venv\Scripts\activate.bat && uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload"

REM Start Frontend
echo Starting Frontend (Vite + React)...
start "SmartFin AI Frontend" cmd /k "cd frontend && npm run dev"

REM Wait 2 seconds and open browser
timeout /t 2 /nobreak >nul
start http://localhost:5173

echo SmartFin AI is launching!
echo Frontend: http://localhost:5173
echo Backend API Docs: http://localhost:8000/docs
