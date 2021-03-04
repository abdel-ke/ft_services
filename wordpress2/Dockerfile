FROM	alpine:3.12.3


VOLUME	["/sys/fs/cgroup"]

# install and update
RUN		apk update
RUN		apk add nginx
RUN		apk add openrc --no-cache
RUN		apk add php php-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom	 php7-session php-mbstring
COPY	src /tmp
RUN		rc-status && touch /run/openrc/softlevel

# create nginx usser and group and homedir
RUN		adduser -D -g 'www' www \
		&& mkdir	/www && mkdir /run/nginx/ \
		&& chown	-R www:www /var/lib/nginx \
		&& chown	-R www:www /www \
		&& echo "<?php phpinfo();?>" > www/index.php

# nginx config
RUN		mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN		mv /tmp/nginx.conf /etc/nginx/nginx.conf

#install telegraf
RUN		echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
	&&	apk add telegraf \
	&&	mkdir	/etc/telegraf \
	&&	mv /etc/telegraf.conf /etc/telegraf/telegraf.conf \
	&&	sed -i 's|.*  hostname = "".*|  hostname = "wordpress"|' /etc/telegraf/telegraf.conf \
	&&	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://influxdb:8086"\]|' /etc/telegraf/telegraf.conf \
	&&	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

# WORDPRESS install
RUN		cd /www && wget http://wordpress.org/latest.tar.gz \
		&& tar -xzvf latest.tar.gz \
		&& rm latest.tar.gz 
		# && cp /tmp/wp-config.php /www/wordpress/wp-config.php
EXPOSE	5050
RUN chmod +x ./tmp/openrc.sh
CMD	./tmp/openrc.sh && tail -f /dev/null