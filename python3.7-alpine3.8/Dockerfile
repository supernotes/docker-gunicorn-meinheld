FROM python:3.7-alpine3.8

LABEL maintainer="Connor Neblett <connor@supernotes.app>"

RUN apk add --no-cache --virtual .build-deps gcc libc-dev postgresql-dev python3-dev musl-dev \
    && pip install meinheld gunicorn psycopg2-binary>=2.7.7 \
    && apk del .build-deps gcc libc-dev postgresql-dev python3-dev musl-dev

ENV BASE_NAME "project"
ENV APP_SUBDIRECTORY "app/"
ENV GUNICORN_CONF_FILE "gunicorn_conf.py"
ENV PREFLIGHT_FILE "preflight.sh"
ENV REQUIREMENTS_FILE "requirements.txt"

COPY ./${GUNICORN_CONF_FILE} /${GUNICORN_CONF_FILE}

COPY ./${PREFLIGHT_FILE} /${PREFLIGHT_FILE}
RUN chmod +x /${PREFLIGHT_FILE}

COPY ./entry.sh /entry.sh
RUN chmod +x /entry.sh

COPY ./run.sh /run.sh
RUN chmod +x /run.sh

COPY ./${BASE_NAME} /${BASE_NAME}

WORKDIR /${BASE_NAME}/
ENV PYTHONPATH /${BASE_NAME}

EXPOSE 80

ENTRYPOINT ["/entry.sh"]
CMD ["/run.sh"]