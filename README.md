# Secure Attendance Management — Django Demonstration

Prototipo independiente de una plataforma de gestión de asistencia para programas formativos, con roles de coordinación, profesorado y alumnado. **No es una API REST pública**: implementa una aplicación web Django y un endpoint de autoguardado.

> **Estado:** demo técnica / portfolio. No desplegar con datos personales reales sin auditoría y endurecimiento de seguridad. No ha sido validado en producción.

## Funciones implementadas

- Gestión de programas, matrícula y calendario lectivo.
- Registro de asistencias, ausencias, retrasos con autoguardado por fila.
- Solicitudes y revisión de justificantes.
- Semáforos de seguimiento semanal con publicación selectiva de comentarios.
- Paneles según rol, notificaciones internas y registros de auditoría.
- Importación desde Excel y exportación a Excel / CSV para conciliación externa.
- Inicio de sesión local; integración opcional con Microsoft Entra ID que requiere configuración y revisión adicional.

## Tecnologías

Python, Django, HTML/CSS, SQLite para demo, PostgreSQL opcional, Docker y Microsoft Entra ID opcional.

## Ejecución local en Windows

1. Instala Python compatible y descarga este repositorio.
2. Ejecuta `INSTALAR_DEMO_V6.bat` desde una carpeta de pruebas.
3. Abre `http://127.0.0.1:8000/`.
4. Accede con `coordinacion`, `profesor` o `alumno1@example.com`, con contraseña `Demo1234!` **exclusivamente para pruebas en localhost**.

Si prefieres ejecutar los comandos manualmente, crea un entorno virtual, instala `requirements.txt` y ejecuta `python manage.py makemigrations attendance`, `python manage.py migrate`, `python manage.py seed_demo` y `python manage.py runserver`.

La demo utiliza SQLite por defecto si no se configura `DB_ENGINE`. El fichero `.env.example` es solo una plantilla: Django no lo carga automáticamente. Copiarlo a `.env` requiere un mecanismo de carga de variables de entorno (por ejemplo, Docker Compose o la configuración del sistema).

## Pruebas

`python manage.py test attendance`

No se ha podido ejecutar la suite en este entorno: Django no está instalado. Se ha comprobado la sintaxis Python. No se garantizan los resultados de integración.

## Arquitectura

- `attendance/models.py`: entidades y relaciones de negocio.
- `attendance/views.py`: lógica web, formularios y endpoints.
- `attendance/services.py`: cálculos y reglas de asistencia.
- `attendance/management/commands/`: datos de ejemplo y tareas periódicas.
- `templates/` y `static/`: interfaz.
- `attendance/tests.py`: pruebas de roles y reglas.

## Límites y seguridad

Consulta [docs/SECURITY_REVIEW.md](docs/SECURITY_REVIEW.md). En particular, el modo `DEBUG`, el acceso a archivos subidos, las contraseñas demo y la configuración de Entra requieren revisión antes de cualquier despliegue público.

## Origen y alcance

Proyecto demostrativo de gestión educativa. Los usuarios y cursos del conjunto de ejemplo son ficticios.

## Licencia

No 
