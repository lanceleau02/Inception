FROM	debian:bullseye

RUN	apt update && apt upgrade -y

# WORDPRESS
RUN	apt install wget -y \
	&& apt install php -y \
	&& apt install php-fpm -y \
	&& apt install php-mysqli -y \
	&& apt install mariadb-client -y

RUN	wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www/html \
	&& cd /var/www/html && tar -xzf wordpress-6.4-fr_FR.tar.gz && rm wordpress-6.4-fr_FR.tar.gz

RUN	chown -R root:root /var/www/html/wordpress

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	conf/script.sh script.sh

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& mkdir -p /run/php/ && mkdir -p /var/www/html

RUN	chmod -R 777 /var/www/html/

EXPOSE	9000

ENTRYPOINT	[ "sh", "script.sh" ]
