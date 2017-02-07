FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git

RUN git clone https://github.com/titpetric/netdata

WORKDIR netdata

ADD git-tag /git-tag

RUN cp releases/v1.5.0/scripts/build.sh /build.sh
RUN cp releases/v1.5.0/scripts/run.sh /run.sh

RUN chmod +x /run.sh /build.sh && sync && sleep 1 && /build.sh

WORKDIR /

ENV NETDATA_PORT=19999 SSMTP_TLS=YES SSMTP_SERVER=smtp.gmail.com SSMTP_PORT=587 SSMTP_HOSTNAME=localhost
EXPOSE $NETDATA_PORT

ENTRYPOINT ["/run.sh"]

