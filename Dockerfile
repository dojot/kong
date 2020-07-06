FROM kong:2.0.4-alpine

COPY kong.conf /etc/kong/

USER root

RUN apk add --no-cache git

RUN luarocks install kong-plugin-jwt-keycloak

USER kong
