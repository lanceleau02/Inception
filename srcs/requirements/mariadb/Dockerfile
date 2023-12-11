FROM	debian:bullseye

# GENERAL
RUN	apt update && apt upgrade -y

# MARIADB
RUN	apt install mariadb-server -y

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	./tools/script.sh /script.sh

CMD	[ "sh", "script.sh" ]

EXPOSE	3306
