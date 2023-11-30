FROM	alpine:3.17

RUN	apk update && apk upgrade

# MARIADB
RUN	apk add --update mysql \
	&& apk add --update mariadb \
	&& mkdir mariadb.conf.d

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	conf/script.sh /script.sh

EXPOSE	3306

CMD	[ "sh", "script.sh" ]
