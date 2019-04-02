import os
import multiprocessing

host = os.getenv("HOST", "0.0.0.0")
port = os.getenv("PORT", "80")

cores = multiprocessing.cpu_count()
workers_per_core = int(os.getenv("WORKERS_PER_CORE", "2"))

# Gunicorn config variables
loglevel = os.getenv("LOG_LEVEL", "info")
workers = cores * workers_per_core
bind = os.getenv("BIND", f"{host}:{port}")
keepalive = 120
errorlog = "-"
