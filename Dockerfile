FROM jsurf/rpi-raspbian

RUN set -x; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    motion \
    uvcdynctrl \
    v4l-utils \
    postfix \
    mutt \
    mailutils \
    libsasl2-2 \
    ca-certificates \
    libsasl2-modules \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/lib/motion \
    && chown motion:motion /var/lib/motion

COPY default-motion /etc/default/motion

COPY motion.conf /etc/motion/motion.conf

COPY postfix-main.cf /etc/postfix/main.cf

COPY sasl_passwd /etc/postfix/sasl_passwd

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8080 8081

ENTRYPOINT [ "/docker-entrypoint.sh" ] 
