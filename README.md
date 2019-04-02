# docker-gunicorn-meinheld
A Docker image for running Python web apps with Gunicorn + Meinheld workers (for big speed)

## Important Considerations
The path of the `requirements` file cannot currently be configured. You can configure the name with `REQUIREMENTS_FILE`, but the file itself must be found in `/[BASE_NAME]/[REQUIREMENTS_FILE]`

## Environment variables
`BASE_NAME`
`APP_SUBDIRECTORY`

`REQUIREMENTS_FILE`

`PREFLIGHT_PATH`
`PREFLIGHT_FILE`

`GUNICORN_CONF_PATH`
`GUNICORN_CONF_FILE`

`PYTHON_MODULE_NAME`
`PYTHON_VARIABLE_NAME`
`PYTHON_APP`

`HOST`
`PORT`
`BIND`

`WORKERS_PER_CORE`
`LOG_LEVEL`
