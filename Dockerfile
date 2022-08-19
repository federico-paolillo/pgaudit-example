FROM bitnami/postgresql:14.5.0

COPY ./scripts/01_create_tables.sql /docker-entrypoint-initdb.d/
COPY ./scripts/02_configure_audit.sql /docker-entrypoint-initdb.d/

COPY --chown=1001:1001 ./cfg/99_logging.conf /bitnami/postgresql/conf/conf.d