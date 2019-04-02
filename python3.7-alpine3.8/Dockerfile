FROM python:3.7-alpine3.8

LABEL maintainer="Connor Neblett <connor@supernotes.app>"

RUN apk add --no-cache --virtual .build-deps gcc libc-dev \
    && pip install meinheld gunicorn \
    && apk del .build-deps gcc libc-dev

COPY ./entry.sh /entry.sh
RUN chmod +x /entry.sh

COPY ./preflight.sh /preflight.sh
RUN chmod +x /preflight.sh

COPY ./run.sh /run.sh
RUN chmod +x /run.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

ENV ROOT_DIRECTORY ./app
ENV APP_SUBDIRECTORY app
COPY ${ROOT_DIRECTORY} /root

WORKDIR /root/
ENV PYTHONPATH /root

RUN pip install -r requirements.txt

EXPOSE 80

ENTRYPOINT ["/entry.sh"]
CMD ["/run.sh"]