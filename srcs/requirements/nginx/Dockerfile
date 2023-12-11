FROM	debian:bullseye

# GENERAL
RUN	apt update && apt upgrade -y

# NGINX
RUN	apt install nginx -y

# SSL
RUN	mkdir -p /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=NAQ/L=Angoulême/O=42/OU=42/CN=laprieur.42.fr/UID=laprieur"

COPY	./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD	[ "nginx", "-g", "daemon off;" ]

EXPOSE	443
