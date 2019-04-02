FROM python:3.7-alpine3.8

LABEL maintainer="Connor Neblett <connor@supernotes.app>"

RUN apk add --no-cache --virtual .build-deps gcc libc-dev \
    && pip install meinheld gunicorn \
    && apk del .build-deps gcc libc-dev

ENV ROOT_DIRECTORY ./app
ENV APP_SUBDIRECTORY app
ENV GUNICORN_CONF_FILE gunicorn_conf.py
ENV PREFLIGHT_FILE preflight.sh
ENV REQUIREMENTS_FILE requirements.txt

COPY ./${PREFLIGHT_FILE} /${PREFLIGHT_FILE}
RUN chmod +x /${PREFLIGHT_FILE}

COPY ./${GUNICORN_CONF_FILE} /${GUNICORN_CONF_FILE}

COPY ./entry.sh /entry.sh
RUN chmod +x /entry.sh

COPY ./run.sh /run.sh
RUN chmod +x /run.sh

COPY ${ROOT_DIRECTORY} /root

WORKDIR /root/
ENV PYTHONPATH /root

ENTRYPOINT ["/entry.sh"]

RUN pip install -r ${REQUIREMENTS_FILE}

EXPOSE 80

CMD ["/run.sh"]