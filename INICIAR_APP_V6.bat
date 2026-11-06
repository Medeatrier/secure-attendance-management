@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist .venv\Scripts\activate.bat (
  echo La demo todavia no esta instalada. Ejecuta primero INSTALAR_DEMO_V6.bat
  pause
  exit /b 1
)
call .venv\Scripts\activate.bat
start "" http://127.0.0.1:8000/
python manage.py runserver
pause
