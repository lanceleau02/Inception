FROM	alpine:3.17

RUN	apk update && apk upgrade

# NGINX
RUN	apk add --update nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

# OPENSSL
RUN	mkdir -p /etc/nginx/ssl \
	&& apk add --update openssl \
	&& openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=NAQ/L=Angoulême/O=42/OU=42/CN=laprieur.42.fr/UID=laprieur"

RUN	mkdir -p /var/www/html/	\
	&& adduser -D -g 'www' www \
	&& chown -R www:www /run/nginx/ \
	&& chown -R www:www /var/www/html/

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
