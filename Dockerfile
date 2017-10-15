FROM java:openjdk-8u111-jre
LABEL maintainer "mozamimy (Moza USANE) <alice@mozami.me>"

ARG ENTRYKIT_VERSION=0.4.0
ARG VERSION=0.7.0
ARG URL=https://github.com/lmenezes/cerebro.git
ARG TIMEZONE=Asia/Tokyo

EXPOSE 9000
WORKDIR /opt/cerebro

RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

RUN curl -L https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz | tar zxf - && \
    mv entrykit /bin/entrykit && \
    chmod +x /bin/entrykit && \
    entrykit --symlink

RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v${VERSION}/cerebro-${VERSION}.tgz | tar zxf - --strip=1

COPY files/opt/cerebro/conf/application.conf.tmpl conf/application.conf.tmpl

ENTRYPOINT [ \
  "render", \
    "/opt/cerebro/conf/application.conf", \
  "--", \
  "switch", \
    "showconf=cat /opt/cerebro/conf/application.conf", \
  "--", \
    "/opt/cerebro/bin/cerebro" \
]
