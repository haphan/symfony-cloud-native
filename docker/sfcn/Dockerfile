FROM haphan/sfcn-base as builder

ARG BRANCH=master
ARG REPO=symfony-cloud-native

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer --version

RUN rm -rf /tmp/src \
    && mkdir -p /tmp/src \
    && wget -q https://github.com/haphan/${REPO}/archive/${BRANCH}.tar.gz -O /tmp/src.tar.gz \
    && tar xfz /tmp/src.tar.gz -C /tmp/src \
    && rm /tmp/src.tar.gz \
    && cd /tmp/src/${REPO}-${BRANCH} \
    && ls -lah \
    # Build Symfony application
    && rm -rf var && mkdir -p var \
    && composer install --no-interaction -vvv \
    && chmod -R 0777 var

FROM haphan/sfcn-base

ARG BRANCH=master
ARG REPO=symfony-cloud-native

COPY --from=builder /tmp/src/${REPO}-${BRANCH}/ /srv/

HEALTHCHECK CMD curl --fail http://localhost:80/healthz || exit 1

ENTRYPOINT [ "/init" ]
