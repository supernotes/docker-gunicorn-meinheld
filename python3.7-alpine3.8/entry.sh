#!/usr/bin/env sh
set -e

if [ -f "/root/${APP_SUBDIRECTORY}/main.py" ]; then
    DEFAULT_MODULE_NAME=${APP_SUBDIRECTORY}.main
elif [ -f "/root/main.py" ]; then
    DEFAULT_MODULE_NAME=main
fi
MODULE_NAME=${MODULE_NAME:-$DEFAULT_MODULE_NAME}
VARIABLE_NAME=${VARIABLE_NAME:-app}
export APP_MODULE=${APP_MODULE:-"$MODULE_NAME:$VARIABLE_NAME"}

if [ -f /root/preflight.sh ]; then
    DEFAULT_PREFLIGHT_PATH=/root/preflight.sh
elif [ -f "/root/${APP_SUBDIRECTORY}/preflight.sh" ]; then
    DEFAULT_PREFLIGHT_PATH=/root/${APP_SUBDIRECTORY}/preflight.sh
else
    DEFAULT_PREFLIGHT_PATH=/preflight.sh
fi
export PREFLIGHT_PATH=${PREFLIGHT_PATH:-$DEFAULT_PREFLIGHT_PATH}

if [ -f /root/gunicorn_conf.py ]; then
    DEFAULT_GUNICORN_CONF=/root/gunicorn_conf.py
elif [ -f "/root/${APP_SUBDIRECTORY}/gunicorn_conf.py" ]; then
    DEFAULT_GUNICORN_CONF=/root/${APP_SUBDIRECTORY}/gunicorn_conf.py
else
    DEFAULT_GUNICORN_CONF=/gunicorn_conf.py
fi
export GUNICORN_CONF=${GUNICORN_CONF:-$DEFAULT_GUNICORN_CONF}

exec "$@"