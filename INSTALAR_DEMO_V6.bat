@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   CONTROL DE ASISTENCIA - VERSION 6
echo   Preparando demo local
 echo ============================================
if not exist .venv\Scripts\python.exe (
  echo Creando entorno virtual...
  python -m venv .venv
  if errorlevel 1 goto :error
)
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
if errorlevel 1 goto :error
pip install -r requirements.txt
if errorlevel 1 goto :error
if not exist attendance\migrations mkdir attendance\migrations
if not exist attendance\migrations\__init__.py type nul > attendance\migrations\__init__.py
python manage.py makemigrations attendance
if errorlevel 1 goto :error
python manage.py migrate
if errorlevel 1 goto :error
python manage.py seed_demo
if errorlevel 1 goto :error
echo.
echo Demo preparada correctamente.
echo Usuario coordinacion: coordinacion / Demo1234!
echo Usuario profesor: profesor / Demo1234!
echo Usuario alumno: alumno1@example.com / Demo1234!
echo.
echo Pulsa una tecla para iniciar la aplicacion...
pause >nul
start "" http://127.0.0.1:8000/
python manage.py runserver
goto :eof
:error
echo.
echo Se ha producido un error. Copia el mensaje de esta ventana para revisarlo.
pause
