#! /usr/bin/env sh
set -e

# run the preflight script
echo "[RUN] preflight ($PREFLIGHT_PATH)"
. "$PREFLIGHT_PATH"

# start up gunicorn (with meinheld workers)
echo "[RUN] gunicorn+meinheld (config: $GUNICORN_CONF)"
exec gunicorn -k egg:meinheld#gunicorn_worker -c "$GUNICORN_CONF" "$APP_MODULE"
