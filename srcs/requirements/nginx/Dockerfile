FROM	debian:bullseye

RUN		apt update && apt upgrade -y

# NGINX
RUN		apt install nginx -y

COPY	conf/nginx.conf /etc/nginx/nginx.conf

# OPENSSL
RUN		mkdir -p /etc/nginx/ssl \
		&& apt install openssl -y \
		&& openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=NAQ/L=Angoulême/O=42/OU=42/CN=laprieur.42.fr/UID=laprieur"

RUN		chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
