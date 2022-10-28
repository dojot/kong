FROM kong:2.4.1-alpine

COPY kong.conf /etc/kong/

USER root

# Exatamente o mesmo codigo de https://github.com/gbbirkisson/kong-plugin-jwt-keycloak
# Foi clonado e buildado localmente pq o lua install esta quebrado pra essa dependencia
COPY ./plugins/jwt-keycloak /custom-plugins/jwt-keycloak
WORKDIR /custom-plugins/jwt-keycloak
RUN luarocks make

COPY ./plugins/pepkong /custom-plugins/pepkong
WORKDIR /custom-plugins/pepkong
RUN luarocks make

USER kong


