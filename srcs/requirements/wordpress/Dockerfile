FROM	debian:bullseye

# GENERAL
RUN	apt update && apt upgrade -y \
	&& apt install wget -y

# PHP
RUN	apt install php -y \
	&& apt install php-fpm -y \
	&& apt install php-mysqli -y \
	&& apt install mariadb-client -y

# WORDPRESS
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv ./wp-cli.phar /usr/local/bin/wp

COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY	./tools/script.sh /script.sh

CMD	[ "sh", "script.sh" ]

EXPOSE	9000
