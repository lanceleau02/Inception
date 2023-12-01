FROM	alpine:3.17

RUN	apk update && apk upgrade

# WORDPRESS
RUN	apk add --update wget \
	&& apk add php \
	&& apk add php-fpm \
	&& apk add php-mysqli \
	&& apk add mariadb-client

RUN	wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www \
	&& cd /var/www && tar -xzf wordpress-6.4-fr_FR.tar.gz && rm wordpress-6.4-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY	./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY	conf/script.sh script.sh

CMD	[ "sh", "script.sh" ]
