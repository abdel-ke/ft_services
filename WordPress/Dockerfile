FROM alpine:3.12.3

RUN apk update
RUN apk add nginx openrc openssl
RUN apk add php php-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom	 php7-session php-mbstring
#Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www

#Create a directory for html files
RUN mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& openrc && rc-status && touch /run/openrc/softlevel \
	&& echo "<?php phpinfo();?>" > www/index.php
#Configuration nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY src /tmp

#Configuring Nginx to listen to port 80 and process .html or .htm files
RUN cp /tmp/nginx.conf /etc/nginx/nginx.conf \
	&& chmod +x /tmp/run.sh

#wordpress installe
RUN		cd /www && wget http://wordpress.org/latest.tar.gz \
		&& tar -xzvf latest.tar.gz \
		&& rm latest.tar.gz \
		&& cp /tmp/wp-config.php /www/wordpress/wp-config.php

CMD sh /tmp/run.sh
	