#!/bin/bash
export KEYCLOAK_ADMIN=admin
export KEYCLOAK_ADMIN_PASSWORD='password'
export KC_HOSTNAME=rsrivastava.io
export KC_HOSTNAME_STRICT=true

cd /keycloak

# Generate jeystore.jks (this is for https-trust-store)
rm -f keystore.jks
# stuff

echo "Starting Keycloak server (DEV)"
sudo ./bin/kc.sh build
sudo KEYCLOAK_ADMIN=$KEYCLOAK_ADMIN \
    KEYCLOAK_ADMIN_PASSWORD=$KEYCLOAK_ADMIN_PASSWORD \
    KC_HOSTNAME=$KC_HOSTNAME \
    KC_HTTP_ENABLED=$KC_HTTP_ENABLED \
    ./bin/kc.sh start-dev \
    --hostname=$KC_HOSTNAME \
    --hostname-strict-backchannel=true \
    --proxy=edge \
    --metrics-enabled=true \
    --health-enabled=true \
    --log="console,file" \
    --log-console-output=default \
    --log-console-color=true \
    --http-port=80 \
    --https-port=443 \
    --https-key-store=file=server_certificate.jks \
    --https-key-store-password='password for above file' \
    --https-client-auth=request \
    --https-protocols=TLSv1.3 \
    --https-trust-store-type=jks \
    --https-trust-store-file=keystore.jks \
    --spi-theme-static-max-age=-1 \
    --spi-theme-cache-themes=false \
    --spi-theme-cache-templates=false \
    --db-pool-initial-size=100 \
    --db-pool-max-size=500 \
    --db-pool-min-size=100 \
    --db=postgres \
    --db-username=postgres \
    --db-password='password' \
    --db-url=jdbc:postgresql://<>/keycloak.db \