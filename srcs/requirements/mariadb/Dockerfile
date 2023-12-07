FROM	debian:bullseye

RUN	apt update && apt upgrade -y

# MARIADB
RUN	apt install mariadb-server netcat -y && mkdir mariadb.conf.d

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	conf/script.sh /script.sh

EXPOSE	3306

ENTRYPOINT [ "sh", "script.sh" ]
