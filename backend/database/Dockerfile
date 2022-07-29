FROM mysql:8.0

WORKDIR /var/lib/mysql

COPY ./dbdumps/dbdump:latest.sql /docker-entrypoint-initdb.d/
