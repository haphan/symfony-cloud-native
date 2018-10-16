#!/usr/bin/env bash

docker rm -f traefik; docker run -d --name traefik --restart always \
-p 80:80 -p 443:443 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(pwd)/config.toml:/traefik.toml \
-v $(pwd)/acme.json:/acme.json \
-v $(pwd)/ssl:/ssl \
traefik

docker run -d --name symfony --restart always \
-l traefik.enable=true \
-l traefik.frontend.rule=Host:sf.app.hp.uk.eu.org \
-l traefik.port=80 \
haphan/sfcnls