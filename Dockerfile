FROM nginx:1.12.2-alpine
LABEL maintainer="tnguen@alfabank.ru"

COPY entrypoint.sh /
COPY nginx.conf.template /

RUN apk add --update --no-cache openssl

ENTRYPOINT ["/entrypoint.sh"]
