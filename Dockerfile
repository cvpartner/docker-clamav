FROM alpine:edge
LABEL maintainer="Markus Kosmal <dude@m-ko.de> https://m-ko.de"

RUN apk add --no-cache bash clamav rsyslog wget clamav-libunrar

COPY conf /etc/clamav
COPY bootstrap.sh /
COPY check.sh /check.sh

EXPOSE 3310/tcp
VOLUME ["/store"]

CMD ["/bootstrap.sh"]

HEALTHCHECK --start-period=500s CMD /check.sh
