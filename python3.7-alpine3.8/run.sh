#! /usr/bin/env sh
set -e

# run the preflight script
echo "[RUN] preflight ($PREFLIGHT_PATH)"
. "$PREFLIGHT_PATH"

# start up gunicorn (with meinheld workers)
echo "[RUN] gunicorn+meinheld (config: $GUNICORN_CONF_PATH)"
exec gunicorn -k egg:meinheld#gunicorn_worker -c "$GUNICORN_CONF_PATH" "$PYTHON_APP"
