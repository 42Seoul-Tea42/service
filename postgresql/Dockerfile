FROM postgres:latest

RUN apt-get update \
    && apt-get install -y postgis postgresql-14-postgis-3

RUN mkdir -p /var/lib/postgresql/data
RUN chown -R postgres:postgres /var/lib/postgresql/data

ARG POSTGRES_DB_NAME
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD

RUN echo "CREATE DATABASE ${POSTGRES_DB_NAME};" > /docker-entrypoint-initdb.d/init_psql.sql && \
    echo "CREATE USER ${POSTGRES_USER} WITH SUPERUSER PASSWORD '${POSTGRES_PASSWORD}';" >> /docker-entrypoint-initdb.d/init_psql.sql && \
    echo "GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB_NAME} TO ${POSTGRES_USER};" >> /docker-entrypoint-initdb.d/init_psql.sql && \
    echo "\\\c ${POSTGRES_DB_NAME};" >> /docker-entrypoint-initdb.d/init_psql.sql && \
    echo "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ${POSTGRES_USER};" >> /docker-entrypoint-initdb.d/init_psql.sql && \
    echo "GRANT ALL PRIVILEGES ON SCHEMA public TO ${POSTGRES_USER};" >> /docker-entrypoint-initdb.d/init_psql.sql

RUN chown postgres:postgres /docker-entrypoint-initdb.d/init_psql.sql

USER postgres

CMD ["postgres", "-D", "/var/lib/postgresql/data"]