ARG VERSION=0.9.4
FROM lmenezes/cerebro:${VERSION}
LABEL maintainer "mozamimy (Moza USANE) <alice@mozami.me>"

ARG ENTRYKIT_VERSION=0.4.0
ARG TIMEZONE=Asia/Tokyo

EXPOSE 9000
USER root

RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

RUN wget -qO- https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz | tar zxf - && \
  mv entrykit /bin/entrykit && \
  chmod +x /bin/entrykit && \
  entrykit --symlink

USER cerebro
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
